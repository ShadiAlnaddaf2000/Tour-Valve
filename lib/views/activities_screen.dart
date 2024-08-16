import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_valve/cubits/activities_cubit/activities_cubit.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripActivitiesCubit, TripActivitiesState>(builder: (context, state) {
      if (state is TripActivitiesInitialState) {
        BlocProvider.of<TripActivitiesCubit>(context).submitActivities();
      }
      if (state is TripActivitiesLoadingState) {
        return const CircularProgressIndicator();
      }
      if (state is TripActivitiesSuccessState) {
        return Container(
          child: Column(
            children: [
              Text('${state.tripActivities?.tripName}'),
              Text('${state.tripActivities?.hotelName}'),
              Text('${state.tripActivities?.restaurantName}'),
              Text('${state.tripActivities?.transportName}'),
              Text('${state.tripActivities?.facilityName}'),
            ],
          ),
        );
      }
      if (state is TripActivitiesErrorState) {
        return Text('data');
      }
      return SizedBox();
    });
  }
}
