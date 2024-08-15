part of 'user_profile_cubit.dart';

@immutable
sealed class UserProfileState {}

final class UserProfileInitialState extends UserProfileState {}

final class UserProfileLoadingState extends UserProfileState {}

class UserProfileSuccessState extends UserProfileState {
  final UserModel user;
  UserProfileSuccessState(this.user);
}

class UserProfileErrorState extends UserProfileState {
  final String error;

  UserProfileErrorState(this.error);
}
