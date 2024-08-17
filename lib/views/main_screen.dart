import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tour_valve/shared/services/remote/end_points.dart';

import '../cubits/main_screen_cubit/main_screen_cubit.dart';
import '../shared/style/colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          // Call your refresh logic here
          BlocProvider.of<TripCubit>(context).submitTrip();
          BlocProvider.of<CountryCubit>(context).submitCountry();
          BlocProvider.of<CityCubit>(context).submitCity();
          BlocProvider.of<HotelCubit>(context).submitHotel();
          BlocProvider.of<RestaurantCubit>(context).submitRestaurant();
          BlocProvider.of<CompaniesCubit>(context).submitCompanies();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          // Ensure scroll physics allows for pull-to-refresh
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
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is TripSuccessState) {
                      return buildHorizontalList(state.trip.map(
                        (e) {
                          return InkWell(
                            onTap: () {
                              context.push('/tripDetails', extra: e);
                            },
                            child: TripCard(
                              imagePath: e.imgs!.first,
                              tripName: e.tripName ?? '',
                              cost: '${e.cost}',
                            ),
                          );
                        },
                      ).toList());
                    }
                    if (state is TripErrorState) {
                      return ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<TripCubit>(context).submitTrip();
                        },
                        child: const Text('Retry'),
                      );
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(height: 16),
                buildSectionTitle('Countries'),
                BlocBuilder<CountryCubit, MainScreenState>(
                  builder: (context, state) {
                    if (state is CountryInitialState) {
                      BlocProvider.of<CountryCubit>(context).submitCountry();
                    }
                    if (state is CountryLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is CountrySuccessState) {
                      return buildHorizontalList(state.cities.map(
                        (e) {
                          return CountryCard(
                            imagePath: e.imgs!.first,
                            location: e.name ?? '',
                          );
                        },
                      ).toList());
                    }
                    if (state is CountryErrorState) {
                      return ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CountryCubit>(context)
                              .submitCountry();
                        },
                        child: const Text('Retry'),
                      );
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(height: 16),
                buildSectionTitle('Cities'),
                BlocBuilder<CityCubit, MainScreenState>(
                  builder: (context, state) {
                    if (state is CityInitialState) {
                      BlocProvider.of<CityCubit>(context).submitCity();
                    }
                    if (state is CityLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is CitySuccessState) {
                      return buildHorizontalList(state.cities.map(
                        (e) {
                          return CityCard(
                            imagePath: e.imgs!.first,
                            cityName: e.name!,
                            countryName: e.countryName!,
                          );
                        },
                      ).toList());
                    }
                    if (state is CityErrorState) {
                      return ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CityCubit>(context).submitCity();
                        },
                        child: const Text('Retry'),
                      );
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                buildSectionTitle('Hotels'),
                const SizedBox(height: 16),
                BlocBuilder<HotelCubit, MainScreenState>(
                  builder: (context, state) {
                    if (state is HotelInitialState) {
                      BlocProvider.of<HotelCubit>(context).submitHotel();
                    }
                    if (state is HotelLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is HotelSuccessState) {
                      return buildHorizontalList(state.hotel.map(
                        (e) {
                          return HotelCard(
                            imagePath: e.imgs!.first,
                            hotelName: e.name!,
                            cityName: 'Hotel in ${e.cityName}',
                          );
                        },
                      ).toList());
                    }
                    if (state is HotelErrorState) {
                      return ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<HotelCubit>(context).submitHotel();
                        },
                        child: const Text('Retry'),
                      );
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(height: 16),
                buildSectionTitle('Restaurant'),
                const SizedBox(height: 16),
                BlocBuilder<RestaurantCubit, MainScreenState>(
                  builder: (context, state) {
                    if (state is RestaurantInitialState) {
                      BlocProvider.of<RestaurantCubit>(context)
                          .submitRestaurant();
                    }
                    if (state is RestaurantLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is RestaurantSuccessState) {
                      return buildHorizontalList(state.restaurant.map(
                        (e) {
                          return RestaurantCard(
                            imagePath: e.imgs!.first,
                            restaurantName: e.name!,
                            cityName: e.cityName!,
                          );
                        },
                      ).toList());
                    }
                    if (state is HotelErrorState) {
                      return ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<HotelCubit>(context).submitHotel();
                        },
                        child: const Text('Retry'),
                      );
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(height: 16),
                buildSectionTitle('Facilities'),
                const SizedBox(height: 16),
                BlocBuilder<FacilitiesCubit, MainScreenState>(
                  builder: (context, state) {
                    if (state is FacilitiesInitialState) {
                      BlocProvider.of<FacilitiesCubit>(context)
                          .submitFacilities();
                    }
                    if (state is FacilitiesLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is FacilitiesSuccessState) {
                      return buildHorizontalList(state.facility.map(
                        (e) {
                          return RestaurantCard(
                            imagePath: '${Urls.domain}${e.imgs!.first}',
                            restaurantName: e.name!,
                            cityName: e.cityName!,
                          );
                        },
                      ).toList());
                    }
                    if (state is RestaurantErrorState) {
                      return ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<RestaurantCubit>(context)
                              .submitRestaurant();
                        },
                        child: const Text('Retry'),
                      );
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(height: 16),
                buildSectionTitle('Transport Companies'),
                const SizedBox(height: 16),
                BlocBuilder<CompaniesCubit, MainScreenState>(
                  builder: (context, state) {
                    if (state is CompaniesInitialState) {
                      BlocProvider.of<CompaniesCubit>(context)
                          .submitCompanies();
                    }
                    if (state is CompaniesLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is CompaniesSuccessState) {
                      return buildHorizontalList(state.company.map(
                        (e) {
                          return RestaurantCard(
                            imagePath: '${e.imgs!.first}',
                            restaurantName: e.name!,
                            cityName: 'Cost ${e.price}',
                          );
                        },
                      ).toList());
                    }
                    if (state is CompaniesErrorState) {
                      return ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CompaniesCubit>(context)
                              .submitCompanies();
                        },
                        child: const Text('Retry'),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Center(
      child: Text(
        'We are here for your convenience',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue[900],
        ),
        textAlign: TextAlign.center,
        maxLines: 2,
      ),
    );
  }

  Widget buildSearchBox() {
    return Center(
      child: SizedBox(
        width: 286,
        height: 49,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: MyColors.colorList,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: const Icon(Icons.search, color: Colors.white),
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none,
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

class CountryCard extends StatelessWidget {
  final String imagePath;
  final String location;

  const CountryCard({
    super.key,
    required this.imagePath,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: 150,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
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
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CityCard extends StatelessWidget {
  final String imagePath;
  final String cityName;
  final String countryName;

  const CityCard({
    super.key,
    required this.imagePath,
    required this.cityName,
    required this.countryName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: 150,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
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
                cityName,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                countryName,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
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
  final String cost;

  const TripCard({
    super.key,
    required this.imagePath,
    required this.tripName,
    required this.cost,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: 250,
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
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
                tripName,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Cost: $cost',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
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
  final String cityName;

  const HotelCard({
    super.key,
    required this.imagePath,
    required this.hotelName,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: 150,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
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
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                cityName,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final String imagePath;
  final String restaurantName;
  final String cityName;

  const RestaurantCard({
    super.key,
    required this.imagePath,
    required this.restaurantName,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: 150,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
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
                restaurantName,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                cityName,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
