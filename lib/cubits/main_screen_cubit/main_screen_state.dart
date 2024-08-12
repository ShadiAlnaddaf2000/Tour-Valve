part of 'main_screen_cubit.dart';

@immutable
sealed class MainScreenState {}

class MainScreenInitialState extends MainScreenState {}

class MainScreenLoadingState extends MainScreenState {}

class MainScreenSuccessState extends MainScreenState {}

class MainScreenErrorState extends MainScreenState {
  final String error;

  MainScreenErrorState(this.error);
}
