import 'package:flutter/cupertino.dart';
import 'package:hamon_task/infrastructure/student/i_student_repo.dart';
import 'package:injectable/injectable.dart';

import '../domain/student_model/student.dart';

@injectable
class StudentProvider with ChangeNotifier {
  IStudentRepo studentRepo;
  StudentProvider({required this.studentRepo});
  List<Student>? students = [];
  bool isLoading = false;
  bool isError = false;
  Student? student;
  String message = "";
  Future<void> getStudents() async {
    isError = false;
    isLoading = true;
    final result = await studentRepo.getStudents();
    isLoading = false;
    result.fold((l) {
      isError = true;
      return message = l.message;
    }, (r) {
      students?.clear();
      students?.addAll(r.students ?? []);
      notifyListeners();
    });
  }

  Future<void> getStudentById(String studentId) async {
    final result = await studentRepo.getStudentById(studentId);
    result.fold((l) => message = l.message, (r) => student = r);
    notifyListeners();
  }
}
