import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tour_valve/models/user_finance_model.dart';
import 'package:tour_valve/shared/services/remote/dio_helper.dart';

import '../../shared/services/remote/end_points.dart';

part 'user_finance_state.dart';

class UserFinanceCubit extends Cubit<UserFinanceState> {
  UserFinanceCubit() : super(UserFinanceInitialState());

  static UserFinanceCubit get(context) => BlocProvider.of(context);

  FinanceDataModel? response;

  void submitUserFinance() {
    emit(UserFinanceLoadingState());
    DioHelper.getData(url: Urls.getFinance).then((onValue) {
      response = FinanceDataModel.fromJson(onValue.data);
      emit(UserFinanceSuccessState(
          financeTransaction: response?.result?.transactions ?? []));
    }).catchError((onError) {
      emit(UserFinanceErrorState());
    });
  }
}
