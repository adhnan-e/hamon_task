import 'package:dartz/dartz.dart';

import '../../domain/api_failure.dart';
import '../../domain/student/student.dart';
import '../../domain/student/student_model.dart';

abstract class IStudentRepo {
  Future<Either<ApiFailure, StudentModel>> getStudents();
  Future<Either<ApiFailure, Student>> getStudentById(String studentId);
}