import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_valve/views/favorites_screen.dart';
import 'package:tour_valve/views/main_screen.dart';
import 'package:tour_valve/views/settings_screen.dart';
import 'package:tour_valve/views/user_profile_screen.dart';

import '../cubits/home_navigator_cubit/home_navigator_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeNavigationCubit, HomeNavigationState>(
        builder: (context, state) {
          return <Widget>[
            const MainScreen(),
            const FavoritesScreen(),
            const SettingsScreen(),
            const UserProfileScreen(),
          ][state.currentPageIndex];
        },
      ),
      bottomNavigationBar:
          BlocBuilder<HomeNavigationCubit, HomeNavigationState>(
        builder: (context, state) {
          return NavigationBar(
            onDestinationSelected: (int index) {
              BlocProvider.of<HomeNavigationCubit>(context).setPage(index);
            },
            selectedIndex: state.currentPageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(CupertinoIcons.heart_fill),
                label: 'Favorites',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
              NavigationDestination(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
