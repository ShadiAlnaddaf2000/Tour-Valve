import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tour_valve/models/trip_activities_model.dart';
import 'package:tour_valve/shared/services/remote/dio_helper.dart';
import 'package:tour_valve/shared/services/remote/end_points.dart';

part 'activities_state.dart';

class TripActivitiesCubit extends Cubit<TripActivitiesState> {
  static TripActivitiesCubit get(context) => BlocProvider.of(context);
  TripActivitiesModel? response;
  final int? tripId;

  TripActivitiesCubit(this.tripId) : super(TripActivitiesInitialState());

  void submitActivities() {
    emit(TripActivitiesLoadingState());
    DioHelper.getData(url: '${Urls.getActivities}$tripId').then((onValue) {
      response = TripActivitiesModel.fromJson(onValue.data);
      emit(TripActivitiesSuccessState(response?.result));
    }).catchError((onError) {
      emit(TripActivitiesErrorState(onError));
    });
  }
}
