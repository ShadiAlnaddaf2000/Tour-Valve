part of 'splash_cubit.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

class AppLoggedIn extends SplashState {}

class AppNotLoggedIn extends SplashState {}
