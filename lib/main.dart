import 'package:flutter/material.dart';
import 'package:tour_valve/shared/app_routes.dart';

import 'package:tour_valve/shared/services/remote/dio_helper.dart';
import 'package:tour_valve/shared/services/storage/cache_helper.dart';
import 'package:tour_valve/shared/style/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(

      debugShowCheckedModeBanner: false,
      title: 'Tour Valve',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.customGreen),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
