part of 'user_finance_cubit.dart';

@immutable
sealed class UserFinanceState {}

final class UserFinanceInitialState extends UserFinanceState {}

final class UserFinanceLoadingState extends UserFinanceState {}

final class UserFinanceSuccessState extends UserFinanceState {
  final List<FinanceTransaction> financeTransaction;

  UserFinanceSuccessState({required this.financeTransaction});
}

final class UserFinanceErrorState extends UserFinanceState {}
