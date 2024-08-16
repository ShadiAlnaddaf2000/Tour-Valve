import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tour_valve/cubits/activities_cubit/trip_activities_cubit.dart';

class ActivitiesScreen extends StatelessWidget {
  ActivitiesScreen({super.key});

  final TextEditingController personCount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trip Activities',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.greenAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: BlocBuilder<TripActivitiesCubit, TripActivitiesState>(
        builder: (context, state) {
          if (state is TripActivitiesInitialState) {
            BlocProvider.of<TripActivitiesCubit>(context).submitActivities();
          }
          if (state is TripActivitiesLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TripActivitiesSuccessState) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildActivityCard(
                    context: context,
                    title: 'Trip Name',
                    description: '${state.tripActivities?.tripName}',
                    icon: Icons.travel_explore,
                  ),
                  _buildActivityCard(
                    context: context,
                    title: 'Hotel Name',
                    description: '${state.tripActivities?.hotelName}',
                    icon: Icons.hotel,
                  ),
                  _buildActivityCard(
                    context: context,
                    title: 'Restaurant Name',
                    description: '${state.tripActivities?.restaurantName}',
                    icon: Icons.restaurant,
                  ),
                  _buildActivityCard(
                    context: context,
                    title: 'Transport Name',
                    description: '${state.tripActivities?.transportName}',
                    icon: Icons.directions_car,
                  ),
                  _buildActivityCard(
                    context: context,
                    title: 'Facility Name',
                    description: '${state.tripActivities?.facilityName}',
                    icon: Icons.local_offer,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      backgroundColor: Colors.greenAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 5,
                    ),
                    onPressed: () {
                      _showBookingDialog(context);
                    },
                    child: const Text(
                      'Book Now',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is TripActivitiesErrorState) {
            return const Center(child: Text('Error loading activities'));
          }
          return const SizedBox();
        },
      ),
      backgroundColor: Colors.grey[100],
    );
  }

  Widget _buildActivityCard({
    required BuildContext context,
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blueAccent,
              child: Icon(icon, color: Colors.white, size: 30),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBookingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: personCount,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      hintText: 'Enter the number of people you want to book.',
                      labelText: 'Number of People',
                    ),
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<TripActivitiesCubit>(context)
                            .submitBook(personCount.text);
                        dialogContext.go('/home');
                      },
                      child: const Text('Submit'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        dialogContext.pop();
                      },
                      child: const Text('Cancel'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
