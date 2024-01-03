import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'di/injection.dart';
import 'navigation/app_routes.dart';
import 'navigation/route_constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: RouteConstants.home,
    );
  }
}
