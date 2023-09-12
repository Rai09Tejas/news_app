import 'package:flutter/material.dart';
import 'package:quantum_task/screens/home_screen.dart';
import 'package:quantum_task/screens/login_screen.dart';
Map<String, Widget Function(BuildContext)> getAppRoutes() {
  Map<String, Widget Function(BuildContext)> appRoutes = {
    initialScreen: (context) => const LoginScreen(),
    HomeScreen.tag: (context) => const HomeScreen(),
    LoginScreen.tag: (context) => const LoginScreen(),
  };

  return appRoutes;
}

const String initialScreen = "/";
