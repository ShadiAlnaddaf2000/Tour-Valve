import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tour_valve/models/user_model.dart';
import 'package:tour_valve/shared/services/remote/dio_helper.dart';

import '../../shared/services/remote/end_points.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(UserProfileInitialState());

  static UserProfileCubit get(context) => BlocProvider.of(context);
  UserModel? response;

  void submitUserProfile() {
    emit(UserProfileLoadingState());
    DioHelper.getData(url: Urls.getUserProfile).then((onValue) {
      response = UserModel.fromJson(onValue.data);
      emit(UserProfileSuccessState(response!));
    }).catchError((onError) {
      emit(UserProfileErrorState(onError));
    });
  }
}
