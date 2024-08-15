part of 'trip_details_cubit.dart';

@immutable
sealed class TripDetailsState {}

final class TripDetailsInitialState extends TripDetailsState {}

final class TripDetailsLoadingState extends TripDetailsState {}

class TripDetailsSuccessState extends TripDetailsState {
  final Trip? trip;

  TripDetailsSuccessState({required this.trip});
}

class TripDetailsErrorState extends TripDetailsState {
  final String error;

  TripDetailsErrorState({required this.error});
}
