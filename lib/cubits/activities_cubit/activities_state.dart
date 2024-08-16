part of 'activities_cubit.dart';

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
}
