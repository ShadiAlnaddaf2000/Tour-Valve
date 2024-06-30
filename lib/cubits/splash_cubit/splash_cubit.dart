import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tour_valve/shared/services/storage/cache_helper.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void currentStateOfApp() {
    if (CacheHelper.getString('token') != null) {
      emit(AppLoggedIn());
    } else {
      emit(AppNotLoggedIn());
    }
  }
}
