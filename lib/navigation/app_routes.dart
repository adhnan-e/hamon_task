import 'package:flutter/material.dart';
import 'package:hamon_task/navigation/route_constants.dart';


class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final page = switch (settings.name) {
      // RouteConstants.root => const LoginScreen(),
      // RouteConstants.home => const HomeScreen(),
      _ => throw Exception('Invalid route')
    };
    debugPrint('<>route ${settings.name}');
    return MaterialPageRoute(
      builder: (context) => page,
    );
  }
}
