import 'package:flutter/material.dart';


class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final page = switch (settings.name) {

      _ => throw Exception('Invalid route')
    };

  }
}
