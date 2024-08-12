import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tour_valve/shared/services/remote/dio_helper.dart';
import 'package:tour_valve/shared/services/storage/cache_helper.dart';

import '../../shared/services/remote/end_points.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
  static SettingsCubit get(context) => BlocProvider.of(context);

  Future<void> signOut() async {
    emit(SignOutLoading());
    final token = CacheHelper.getString('token');
    DioHelper.signOut(token: token, url: LOGOUT)
        .then((value) {
      CacheHelper.sharedPreferences.clear();
      emit(SignOutSuccess());
    }).catchError((error) {
      emit(SignOutFailure());
    });
  }
}
