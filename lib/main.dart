import 'package:flutter/material.dart';
import 'package:tour_valve/shared/app_routes.dart';

import 'package:tour_valve/shared/services/remote/dio_helper.dart';
import 'package:tour_valve/views/login_screen.dart';



void main() async {
  await DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {

   const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tour Valve',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
