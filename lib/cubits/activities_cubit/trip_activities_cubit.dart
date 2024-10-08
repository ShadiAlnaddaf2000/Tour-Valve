import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tour_valve/models/trip_activities_model.dart';
import 'package:tour_valve/shared/services/remote/dio_helper.dart';
import 'package:tour_valve/shared/services/remote/end_points.dart';

part 'trip_activities_state.dart';

class TripActivitiesCubit extends Cubit<TripActivitiesState> {
  static TripActivitiesCubit get(context) => BlocProvider.of(context);
  TripActivitiesModel? response;
  final int? tripId;

  TripActivitiesCubit(this.tripId) : super(TripActivitiesInitialState());

  void submitActivities() async {
    emit(TripActivitiesLoadingState());

    try {
      var onValue = await DioHelper.postData(
        url: '${Urls.getTripActivities}$tripId',
      );

      response = TripActivitiesModel.fromJson(onValue.data);

      emit(TripActivitiesSuccessState(response?.result));
    } catch (e) {
      emit(TripActivitiesErrorState(e.toString()));
    }
  }

  void submitBook(String personCount) async {
    emit(BookingLoadingState());

    try {
      var data = await DioHelper.postData(
        url: Urls.addBook,
        data: {
          'trip_id': tripId,
          'person_number': personCount,
        },
      );
      String res = data.data['message'];
      print(res);
    } catch (e) {
      print(e.toString());
      emit(BookingErrorState());
    }
  }
}
