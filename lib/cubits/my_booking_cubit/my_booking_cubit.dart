import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tour_valve/models/my_booking_model.dart';
import 'package:tour_valve/shared/services/remote/dio_helper.dart';
import 'package:tour_valve/shared/services/remote/end_points.dart';

part 'my_booking_state.dart';

class MyBookingCubit extends Cubit<MyBookingState> {
  MyBookingCubit() : super(MyBookingInitialState());

  static MyBookingCubit get(context) => BlocProvider.of(context);

  UserTripsModel? response;

  void submitMyBooking() {
    emit(MyBookingLoadingState());
    DioHelper.getData(url: Urls.getMyBooking).then((onValue) {
      response = UserTripsModel.fromJson(onValue.data);
      emit(MyBookingSuccessState(booking: response?.result?.trips ?? []));
    }).catchError((onError) {
      emit(MyBookingErrorState());
    });
  }

  deleteBook(int id) {
    emit(LoadingDeletedBookState());
    DioHelper.postData(url: '${Urls.deleteBook}$id').then((onValue) {
      emit(SuccessDeletedBookState());
    }).catchError((onError) {
      emit(FailedDeletedBookState());
    });
  }
}
