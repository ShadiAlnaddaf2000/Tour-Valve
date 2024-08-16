import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_valve/cubits/user_profile_cubit/user_profile_cubit.dart';
import 'package:tour_valve/shared/app_routes.dart';
import 'package:tour_valve/shared/services/remote/dio_helper.dart';
import 'package:tour_valve/shared/services/storage/cache_helper.dart';
import 'package:tour_valve/shared/style/colors.dart';

import 'cubits/bloc_observer.dart';
import 'cubits/main_screen_cubit/main_screen_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Bloc.observer = SimpleBlocObserver();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => CountryCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => HotelCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => TripCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => UserProfileCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Tour Valve',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: MyColors.customGreen),
          useMaterial3: true,
        ),
        routerConfig: appRouter,
      ),
    );
  }
}
