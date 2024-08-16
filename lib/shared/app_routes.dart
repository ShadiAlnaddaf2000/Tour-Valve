import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tour_valve/cubits/activities_cubit/trip_activities_cubit.dart';
import 'package:tour_valve/cubits/home_navigator_cubit/home_navigator_cubit.dart';
import 'package:tour_valve/cubits/login_cubit/login_cubit.dart';
import 'package:tour_valve/cubits/register_cubit/register_cubit.dart';
import 'package:tour_valve/cubits/splash_cubit/splash_cubit.dart';
import 'package:tour_valve/models/all_trip_model.dart';
import 'package:tour_valve/views/home_screen.dart';
import 'package:tour_valve/views/login_screen.dart';
import 'package:tour_valve/views/splash_screen.dart';
import 'package:tour_valve/views/trip_activities_screen.dart';
import 'package:tour_valve/views/user_finance_screen.dart';

import '../cubits/trip_details_cubit/trip_details_cubit.dart';
import '../cubits/user_finance_cubit/user_finance_cubit.dart';
import '../views/register_screen.dart';
import '../views/trip_details_screen.dart';

class RoutesName {
  static const splashScreen = '/splashScreen';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const tripDetails = '/tripDetails';
  static const tripActivities = '/tripActivities';
}

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => BlocProvider(
        create: (context) => SplashCubit(),
        child: const SplashScreen(),
      ),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => BlocProvider(
        create: (context) => LoginCubit(),
        child: LoginScreen(),
      ),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => BlocProvider(
        create: (context) => RegisterCubit(),
        child: RegisterScreen(),
      ),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => BlocProvider(
        create: (context) => HomeNavigationCubit(),
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
      path: '/tripDetails',
      builder: (context, state) {
        final tripInfo = state.extra as Trip;
        return BlocProvider(
          create: (context) => TripDetailsCubit(tripInfo),
          child: TripDetailsScreen(
            tripDetails: tripInfo,
          ),
        );
      },
    ),
    GoRoute(
      path: '/tripActivities',
      builder: (context, state) {
        final tripId = state.extra as int;
        return BlocProvider(
          create: (context) => TripActivitiesCubit(tripId),
          child: ActivitiesScreen(),
        );
      },
    ),
    GoRoute(
        path: '/userFinance',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => UserFinanceCubit(),
            child: UserFinanceScreen(),
          );
        })
  ],
);
