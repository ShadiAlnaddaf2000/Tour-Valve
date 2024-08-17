// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'main_screen_cubit.dart';

@immutable
sealed class MainScreenState {}

class CountryInitialState extends MainScreenState {}

class CountryLoadingState extends MainScreenState {}

class CountrySuccessState extends MainScreenState {
  final List<CY.Country> cities;

  CountrySuccessState({
    required this.cities,
  });
}

class CountryErrorState extends MainScreenState {
  final String error;

  CountryErrorState(this.error);
}

class HotelInitialState extends MainScreenState {}

class HotelLoadingState extends MainScreenState {}

class HotelSuccessState extends MainScreenState {
  final List<Hotel> hotel;

  HotelSuccessState({required this.hotel});
}

class HotelErrorState extends MainScreenState {
  final String error;

  HotelErrorState(this.error);
}

class TripInitialState extends MainScreenState {}

class TripLoadingState extends MainScreenState {}

class TripSuccessState extends MainScreenState {
  final List<Trip> trip;

  TripSuccessState({required this.trip});
}

class TripErrorState extends MainScreenState {
  final String error;

  TripErrorState(this.error);
}

class CityInitialState extends MainScreenState {}

class CityLoadingState extends MainScreenState {}

class CitySuccessState extends MainScreenState {
  final List<City> cities;

  CitySuccessState({required this.cities});
}

class CityErrorState extends MainScreenState {}

class RestaurantInitialState extends MainScreenState {}

class RestaurantLoadingState extends MainScreenState {}

class RestaurantSuccessState extends MainScreenState {
  final List<Restaurant> restaurant;

  RestaurantSuccessState({required this.restaurant});
}

class RestaurantErrorState extends MainScreenState {}

class FacilitiesInitialState extends MainScreenState {}

class FacilitiesLoadingState extends MainScreenState {}

class FacilitiesSuccessState extends MainScreenState {
  final List<Facility> facility;

  FacilitiesSuccessState({required this.facility});
}

class FacilitiesErrorState extends MainScreenState {}

class CompaniesInitialState extends MainScreenState {}

class CompaniesLoadingState extends MainScreenState {}

class CompaniesSuccessState extends MainScreenState {
  final List<Co.Facility> company;

  CompaniesSuccessState({required this.company});
}

class CompaniesErrorState extends MainScreenState {}
