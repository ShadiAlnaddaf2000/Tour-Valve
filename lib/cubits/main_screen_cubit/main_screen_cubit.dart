import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tour_valve/models/all_facilities_model.dart';
import 'package:tour_valve/models/all_trip_model.dart';
import 'package:tour_valve/models/city_model.dart';
import 'package:tour_valve/shared/services/remote/end_points.dart';

import '../../models/all_company_model.dart' as Co;
import '../../models/all_country_model.dart' as CY;
import '../../models/all_hotel_model.dart';
import '../../models/all_restaurant_model.dart';
import '../../shared/services/remote/dio_helper.dart';

part 'main_screen_state.dart';

class CountryCubit extends Cubit<MainScreenState> {
  CountryCubit() : super(CountryInitialState());

  static CountryCubit get(context) => BlocProvider.of(context);
  CY.AllCountriesModel? response;

  void submitCountry() {
    emit(CountryLoadingState());

    DioHelper.getData(
      url: Urls.getCountry,
    ).then((onValue) {
      response = CY.AllCountriesModel.fromJson(onValue.data);
      emit(CountrySuccessState(cities: response?.result?.country ?? []));
    }).catchError((error) {
      print(error);
      emit(CountryErrorState(error.toString()));
    });
  }
}

class CityCubit extends Cubit<MainScreenState> {
  CityCubit() : super(CityInitialState());

  static CityCubit get(context) => BlocProvider.of(context);
  AllCitiesModel? response;

  void submitCity() {
    emit(CityLoadingState());

    DioHelper.getData(
      url: Urls.getAllCity,
    ).then((onValue) {
      response = AllCitiesModel.fromJson(onValue.data);
      emit(CitySuccessState(cities: response?.result?.cities ?? []));
    }).catchError((error) {
      print(error);
      emit(CityErrorState());
    });
  }
}

class HotelCubit extends Cubit<MainScreenState> {
  HotelCubit() : super(HotelInitialState());

  static HotelCubit get(context) => BlocProvider.of(context);

  AllHotelsModel? response;

  void submitHotel() {
    emit(HotelLoadingState());
    DioHelper.getData(url: Urls.getHotel).then((onValue) {
      response = AllHotelsModel.fromJson(onValue.data);

      emit(HotelSuccessState(hotel: response?.result?.hotels ?? []));
    }).catchError((onError) {
      emit(HotelErrorState(onError.toString()));
    });
  }
}

class TripCubit extends Cubit<MainScreenState> {
  TripCubit() : super(TripInitialState());

  static TripCubit get(context) => BlocProvider.of(context);
  AllTripsModel? response;

  void submitTrip() {
    emit(TripLoadingState());
    DioHelper.getData(
      url: Urls.getTrip,
    ).then((onValue) {
      response = AllTripsModel.fromJson(onValue.data);
      emit(TripSuccessState(trip: response?.result?.trips ?? []));
    }).catchError((onError) {
      emit(TripErrorState(onError.toString()));
    });
  }
}

class RestaurantCubit extends Cubit<MainScreenState> {
  RestaurantCubit() : super(RestaurantInitialState());

  static RestaurantCubit get(context) => BlocProvider.of(context);
  AllRestaurantsModel? response;

  void submitRestaurant() {
    emit(RestaurantLoadingState());

    DioHelper.getData(
      url: Urls.getAllRestaurant,
    ).then((onValue) {
      response = AllRestaurantsModel.fromJson(onValue.data);
      emit(RestaurantSuccessState(
          restaurant: response?.result?.restaurants ?? []));
    }).catchError((error) {
      print(error);
      emit(RestaurantErrorState());
    });
  }
}

class FacilitiesCubit extends Cubit<MainScreenState> {
  FacilitiesCubit() : super(FacilitiesInitialState());

  static FacilitiesCubit get(context) => BlocProvider.of(context);
  AllFacilitiesModel? response;

  void submitFacilities() {
    emit(FacilitiesLoadingState());

    DioHelper.getData(
      url: Urls.getAllFacilities,
    ).then((onValue) {
      response = AllFacilitiesModel.fromJson(onValue.data);
      emit(
          FacilitiesSuccessState(facility: response?.result?.facilities ?? []));
    }).catchError((error) {
      print(error);
      emit(FacilitiesErrorState());
    });
  }
}

class CompaniesCubit extends Cubit<MainScreenState> {
  CompaniesCubit() : super(CompaniesInitialState());

  static CompaniesCubit get(context) => BlocProvider.of(context);
  Co.AllCompaniesModel? response;

  void submitCompanies() {
    emit(CompaniesLoadingState());

    DioHelper.getData(
      url: Urls.getAllCompany,
    ).then((onValue) {
      response = Co.AllCompaniesModel.fromJson(onValue.data);
      emit(CompaniesSuccessState(company: response?.result?.facilities ?? []));
    }).catchError((error) {
      print(error);
      emit(CompaniesErrorState());
    });
  }
}
