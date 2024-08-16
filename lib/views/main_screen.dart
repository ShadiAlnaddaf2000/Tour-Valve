import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubits/main_screen_cubit/main_screen_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(),
              const SizedBox(height: 16),
              buildSearchBox(),
              const SizedBox(height: 32),
              buildSectionTitle('Our Tour'),
              BlocBuilder<TripCubit, MainScreenState>(
                builder: (context, state) {
                  if (state is TripInitialState) {
                    BlocProvider.of<TripCubit>(context).submitTrip();
                  }
                  if (state is TripLoadingState) {
                    return const CircularProgressIndicator();
                  }
                  if (state is TripSuccessState) {
                    return buildHorizontalList(state.trip.map(
                      (e) {
                        return InkWell(
                          onTap: (){
                            context.push('/tripDetails',extra: e);
                          },
                          child: TripCard(
                            imagePath: e.imgs!.first,
                            tripName: e.tripName ?? '',
                            startDate: 'from ${e.tripName}',
                            endDate: 'to ${e.endingDate}',
                            cost: '${e.cost}',
                          ),
                        );
                      },
                    ).toList());
                  }

                  if (state is CountryErrorState) {
                    return ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CountryCubit>(context).submitCountry();
                      },
                      child: const Text('re'),
                    );
                  }
                  return const SizedBox();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              buildSectionTitle('popular places'),
              const SizedBox(height: 16),
              BlocBuilder<CountryCubit, MainScreenState>(
                builder: (context, state) {
                  if (state is CountryInitialState) {
                    BlocProvider.of<CountryCubit>(context).submitCountry();
                  }
                  if (state is CountryLoadingState) {
                    return const CircularProgressIndicator();
                  }
                  if (state is CountrySuccessState) {
                    return buildHorizontalList(state.cities.map(
                      (e) {
                        return DestinationCard(
                          imagePath: e.imgs!.first,
                          location: e.name ?? '',
                        );
                      },
                    ).toList());
                  }

                  if (state is CountryErrorState) {
                    return ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CountryCubit>(context).submitCountry();
                      },
                      child: const Text('re'),
                    );
                  }
                  return const SizedBox();
                },
              ),
              const SizedBox(height: 32),
              buildSectionTitle('popular hotels'),
              const SizedBox(height: 16),
              BlocBuilder<HotelCubit, MainScreenState>(
                builder: (context, state) {
                  if (state is HotelInitialState) {
                    BlocProvider.of<HotelCubit>(context).submitHotel();
                  }
                  if (state is HotelLoadingState) {
                    return const CircularProgressIndicator();
                  }
                  if (state is HotelSuccessState) {
                    return buildHorizontalList(state.hotel.map(
                      (e) {
                        return HotelCard(
                          imagePath: e.imgs!.first,
                          hotelName: e.name!,
                          price: e.cityName!,
                        );
                      },
                    ).toList());
                  }

                  if (state is HotelErrorState) {
                    return ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<HotelCubit>(context).submitHotel();
                      },
                      child: const Text('re'),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Text(
      'We are here for your convenience',
      style: TextStyle(
        fontFamily: 'Poppins', // Use the family name specified in pubspec.yaml
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blue[900],
      ),
      textAlign: TextAlign.center,
      maxLines: 2, // Limit text to 2 lines
    );
  }

  Widget buildSearchBox() {
    return Center(
      child: SizedBox(
        width: 286,
        height: 49,
        child: TextField(
          decoration: InputDecoration(
            hintText: ' search',
            prefixIcon: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                      colors: MyColors.colorList, // Define gradient colors
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                child: const Icon(Icons.search)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.blue[900],
      ),
    );
  }

  Widget buildHorizontalList(List<Widget> cards) {
    return SizedBox(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: cards,
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Favorites Page'),
    );
  }
}

class DestinationCard extends StatelessWidget {
  final String imagePath;
  final String location;

  const DestinationCard(
      {super.key, required this.imagePath, required this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 150,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(4)),
                child: Image.network(
                  imagePath,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                location,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final String imagePath;
  final String hotelName;
  final String price;

  const HotelCard(
      {super.key,
      required this.imagePath,
      required this.hotelName,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 150,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(4)),
                child: Image.network(
                  imagePath,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                hotelName,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(price),
            ),
          ],
        ),
      ),
    );
  }
}

class TripCard extends StatelessWidget {
  final String imagePath;
  final String tripName;
  final String startDate;
  final String endDate;
  final String cost;

  const TripCard(
      {super.key,
      required this.imagePath,
      required this.tripName,
      required this.startDate,
      required this.endDate,
      required this.cost});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 500,
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(4)),
                child: Image.network(
                  imagePath,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                tripName,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                'from $startDate',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                'to $endDate',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(cost),
            ),
          ],
        ),
      ),
    );
  }
}

class MyColors {
  static const List<Color> colorList = [Colors.blue, Colors.red];
}
