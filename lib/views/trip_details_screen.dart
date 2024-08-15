import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_valve/cubits/trip_details_cubit/trip_details_cubit.dart';

class TripDetailsScreen extends StatelessWidget {
  const TripDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tripDetails = context.read<TripDetailsCubit>().trip;
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Text('${tripDetails!.tripName}'),
            Text('${tripDetails.cost}'),
            Text('${tripDetails.currentNumber}'),
            Text('${tripDetails.startingDate}'),
            Text('${tripDetails.endingDate}'),
            Text('${tripDetails.description}'),
            Text('${tripDetails.userName}'),
            CarouselSlider(
              options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2,
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(milliseconds: 1500)),
              items: tripDetails.imgs!
                  .map((item) => Container(
                        child: Center(
                          child: Image.network(item,
                              fit: BoxFit.cover, width: 500),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
