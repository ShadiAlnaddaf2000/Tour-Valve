import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_valve/shared/services/storage/cache_helper.dart';


import '../../shared/services/remote/dio_helper.dart';
import '../../shared/services/remote/end_points.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());


  Future<void> userLogin({
    required email,
    required password,
  }) async {
    emit(LoginLoadingState());

    DioHelper.postData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      CacheHelper.sharedPreferences.setString('token', value.data['access_token']);
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }
}
