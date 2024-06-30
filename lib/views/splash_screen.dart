import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tour_valve/cubits/splash_cubit/splash_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SplashCubit>(context).currentStateOfApp();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        Timer(const Duration(milliseconds: 2000), () {
          if (state is AppNotLoggedIn) {
            context.go('/login');
          } else if (state is AppLoggedIn) {
            context.go('/home');
          }
        });
      },
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
      ),
    );
  }
}
