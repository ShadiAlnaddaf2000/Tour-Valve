import 'package:go_router/go_router.dart';
import 'package:tour_valve/views/home_screen.dart';
import 'package:tour_valve/views/login_screen.dart';

import '../views/register_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomeScreen(),
    ),
  ],
);
