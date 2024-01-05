import 'package:flutter/material.dart';
import 'package:hamon_task/provider/classroom_provider.dart';
import 'package:hamon_task/provider/student_provider.dart';
import 'package:hamon_task/provider/subject_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'di/injection.dart';
import 'navigation/app_routes.dart';
import 'navigation/route_constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => getIt<StudentProvider>()),
    ChangeNotifierProvider(create: (context) => getIt<SubjectProvider>()),
    ChangeNotifierProvider(create: (context) => getIt<ClassroomProvider>()),
  ], child: const MyApp()));
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
