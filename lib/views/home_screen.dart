import 'package:flutter/material.dart';
import 'package:tour_valve/shared/services/storage/cache_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: MaterialButton(onPressed: () {
        print(CacheHelper.sharedPreferences.get('token'));
      }),
    );
  }
}
