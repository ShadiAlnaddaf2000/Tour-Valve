part of 'trip_activities_cubit.dart';

@immutable
sealed class TripActivitiesState {}

final class TripActivitiesInitialState extends TripActivitiesState {}

final class TripActivitiesLoadingState extends TripActivitiesState {}

final class TripActivitiesSuccessState extends TripActivitiesState {
  final Result? tripActivities;

  TripActivitiesSuccessState(this.tripActivities);
}

final class TripActivitiesErrorState extends TripActivitiesState {
  final String error;

  TripActivitiesErrorState(this.error);

  @override
  String toString() {
    return error;
  }
}

final class BookingLoadingState extends TripActivitiesState {}

final class BookingSuccessState extends TripActivitiesState {}

final class BookingErrorState extends TripActivitiesState {}
