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
  var headers = {
    'Content-Type': 'application/x-www-form-urlencoded'
  };
  var request = http.Request('PATCH', Uri.parse('http://nibrahim.pythonanywhere.com/classrooms/2?api_key=36F00'));
  request.bodyFields = {
    'subject': '4'
  };
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  }
  else {
    print(response.reasonPhrase);
  }
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
