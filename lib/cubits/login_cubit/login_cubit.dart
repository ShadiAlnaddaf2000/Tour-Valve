import 'package:flutter_bloc/flutter_bloc.dart';


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
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }
}
