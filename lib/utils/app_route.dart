import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:node_app/pages/login_screen.dart';
import 'package:node_app/pages/registation_screen.dart';

import '../pages/splash_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


final GoRouter _router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/registration',
      builder: (context, state) => const RegistationScreen(),
    ),


  ],
);

GoRouter get router => _router;