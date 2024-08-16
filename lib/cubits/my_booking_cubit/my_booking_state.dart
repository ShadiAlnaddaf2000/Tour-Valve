part of 'my_booking_cubit.dart';

@immutable
sealed class MyBookingState {}

final class MyBookingInitialState extends MyBookingState {}

final class MyBookingLoadingState extends MyBookingState {}

final class MyBookingSuccessState extends MyBookingState {
  final List<Trip> booking;

  MyBookingSuccessState({required this.booking});
}

final class MyBookingErrorState extends MyBookingState {}

final class SuccessDeletedBookState extends MyBookingState {}

final class FailedDeletedBookState extends MyBookingState {}

final class LoadingDeletedBookState extends MyBookingState {}
