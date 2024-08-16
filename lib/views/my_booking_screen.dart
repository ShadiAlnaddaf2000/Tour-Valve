import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_valve/cubits/my_booking_cubit/my_booking_cubit.dart';

class MyBookingScreen extends StatelessWidget {
  const MyBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MyBookingCubit>(context).submitMyBooking();
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<MyBookingCubit, MyBookingState>(
          builder: (context, state) {
            if (state is MyBookingInitialState) {
              BlocProvider.of<MyBookingCubit>(context).submitMyBooking();
            }
            if (state is MyBookingLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is MyBookingSuccessState) {
              return buildVerticalList(state.booking.map((e) {
                return MyBookingCard(
                  tripName: '${e.tripName}',
                  cost: '${e.cost}',
                  personNumber: '${e.personNumber}',
                  totalPrice: '${e.totalPrice}',
                  createDate: '${e.createDate?.substring(0, 10)}',
                  onPressed: () {
                    BlocProvider.of<MyBookingCubit>(context).deleteBook(e.id!);
                    BlocProvider.of<MyBookingCubit>(context).submitMyBooking();
                  },
                );
              }).toList());
            }
            if (state is Error) {
              return const Text('Error');
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class MyBookingCard extends StatelessWidget {
  final String tripName;
  final String cost;
  final String personNumber;
  final String totalPrice;
  final String createDate;
  void Function()? onPressed;

  MyBookingCard({
    required this.tripName,
    required this.cost,
    required this.personNumber,
    required this.totalPrice,
    required this.createDate,
    required this.onPressed,
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
        child: ListTile(
          title: Text(
            'TripName: $tripName',
            style: TextStyle(
              color: Colors.blue.shade800,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                'Cost Per Person: $cost',
                style: const TextStyle(
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Count booking Person : $personNumber',
                style: const TextStyle(
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Total Cost: $totalPrice',
                style: const TextStyle(
                  color: Colors.black87,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Create Date: $createDate',
                style: const TextStyle(
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          trailing: IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
                size: 35,
              )),
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
