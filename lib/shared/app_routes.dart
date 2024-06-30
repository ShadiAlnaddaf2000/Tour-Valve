import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tour_valve/cubits/home_navigator_cubit/home_navigator_cubit.dart';
import 'package:tour_valve/cubits/login_cubit/login_cubit.dart';
import 'package:tour_valve/cubits/register_cubit/register_cubit.dart';
import 'package:tour_valve/cubits/splash_cubit/splash_cubit.dart';
import 'package:tour_valve/views/home_screen.dart';
import 'package:tour_valve/views/login_screen.dart';
import 'package:tour_valve/views/splash_screen.dart';

import '../views/register_screen.dart';

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
  ],
);
