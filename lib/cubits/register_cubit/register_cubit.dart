import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/services/remote/dio_helper.dart';
import '../../shared/services/remote/end_points.dart';
import '../../shared/services/storage/cache_helper.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  void userRegister({
    required firstname,
    required lastname,
    required email,
    required password,
    required address,
    required String confirmedPassword,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(url: REGISTER, data: {
      'first_name': firstname,
      'last_name': lastname,
      'email': email,
      'password': password,
      'confirmed-password': password,
      'address': address,
    }).then((value) {
      CacheHelper.sharedPreferences
          .setString('token', value.data['access_token']);
      emit(RegisterSuccessState());
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }
}
