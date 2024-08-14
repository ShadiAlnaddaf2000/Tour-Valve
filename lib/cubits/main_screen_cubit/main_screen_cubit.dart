import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tour_valve/models/all_trip_model.dart';
import 'package:tour_valve/shared/services/remote/end_points.dart';

import '../../models/all_country_model.dart';
import '../../models/all_hotel_model.dart';
import '../../shared/services/remote/dio_helper.dart';

part 'main_screen_state.dart';

class CountryCubit extends Cubit<MainScreenState> {
  CountryCubit() : super(CountryInitialState());

  static CountryCubit get(context) => BlocProvider.of(context);
  AllCountriesModel? response;

  void submitCountry() {
    emit(CountryLoadingState());

    DioHelper.getData(
      url: Urls.getCountry,
    ).then((onValue) {
      response = AllCountriesModel.fromJson(onValue.data);
      emit(CountrySuccessState(cities: response?.result?.country ?? []));
    }).catchError((error) {
      print(error);
      emit(CountryErrorState(error.toString()));
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
      print(onError);
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
      print(onError);
      emit(TripErrorState(onError.toString()));
    });
  }
}
