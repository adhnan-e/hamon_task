import 'package:flutter/material.dart';
import 'package:hamon_task/navigation/route_constants.dart';
import 'package:hamon_task/presentation/classroom/classroom_list_screen.dart';
import 'package:hamon_task/presentation/classroom/classroom_screen.dart';
import 'package:hamon_task/presentation/student/student_screen.dart';
import 'package:hamon_task/presentation/student/students_list_screen.dart';
import 'package:hamon_task/presentation/subject/subject_list_screen.dart';
import 'package:hamon_task/presentation/subject/subject_screen.dart';

import '../presentation/home/home_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final page = switch (settings.name) {
      RouteConstants.home => const HomeScreen(),
      RouteConstants.classroomList => const ClassroomListScreen(),
      RouteConstants.classroom => const ClassroomScreen(),
      RouteConstants.students => const StudentScreen(),
      RouteConstants.studentsList => const StudentsListScreen(),
      RouteConstants.subjects => const SubjectScreen(),
      RouteConstants.subjectsList => const SubjectListScreen(),
      _ => throw Exception('Invalid route')
    };
    debugPrint('<>route ${settings.name}');
    return MaterialPageRoute(
      builder: (context) => page,
    );
  }
}
