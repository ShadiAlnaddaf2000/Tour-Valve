import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_valve/cubits/user_finance_cubit/user_finance_cubit.dart';

class UserFinanceScreen extends StatelessWidget {
  const UserFinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('User Finance'),
          backgroundColor: Colors.blue.shade800,
        ),
        body: BlocBuilder<UserFinanceCubit, UserFinanceState>(
          builder: (context, state) {
            if (state is UserFinanceInitialState) {
              BlocProvider.of<UserFinanceCubit>(context).submitUserFinance();
            }
            if (state is UserFinanceLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserFinanceSuccessState) {
              return buildVerticalList(state.financeTransaction.map((e) {
                return FinanceCard(
                  chargeValue: '${e.amount}',
                  balanceBefore: '${e.before}',
                  balanceAfter: '${e.after}',
                  chargeType: '${e.type}',
                  transactionDescription: '${e.description}',
                  transactionDate: '${e.date}',
                );
              }).toList());
            }
            if (state is UserFinanceErrorState) {
              return const Center(
                child: Text(
                  'Error occurred',
                  style: TextStyle(color: Colors.red),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class FinanceCard extends StatelessWidget {
  final String chargeValue;
  final String balanceBefore;
  final String balanceAfter;
  final String chargeType;
  final String transactionDate;
  final String transactionDescription;

  const FinanceCard({
    required this.chargeValue,
    required this.balanceBefore,
    required this.balanceAfter,
    required this.chargeType,
    required this.transactionDate,
    required this.transactionDescription,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment: $chargeValue SYP',
              style: TextStyle(
                color: Colors.blue.shade800,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Before: $balanceBefore SYP',
                  style: TextStyle(color: Colors.green.shade700),
                ),
                Text(
                  'After: $balanceAfter SYP',
                  style: TextStyle(color: Colors.red.shade700),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Type: $chargeType',
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Description: $transactionDescription',
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Date: $transactionDate',
              style: const TextStyle(
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildVerticalList(List<Widget> cards) {
  return ListView(
    padding: const EdgeInsets.all(10),
    children: cards,
  );
}
