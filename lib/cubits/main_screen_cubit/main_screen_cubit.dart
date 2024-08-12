import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/all_country_model.dart';
import '../../shared/services/remote/dio_helper.dart';

part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainScreenInitialState());

  static MainScreenCubit get(context) => BlocProvider.of(context);
  AllCountriesModel? allCountriesModel;
  List<dynamic>? items;

  void submitHomePage() {
    emit(MainScreenLoadingState());

    DioHelper.getData(url: 'country/getAllCountries', query: {})
        .then((onValue) {
      //allCountriesModel=AllCountriesModel.fromJson()
      //items=allCountriesModel.result.country;
      emit(MainScreenSuccessState());
    }).catchError((error) {
      print('the error is=${error.toString()}');
    }).catchError((error) {
      emit(MainScreenErrorState(error.toString()));
    });
  }
}
