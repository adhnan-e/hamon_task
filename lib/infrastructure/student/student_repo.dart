import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/api_failure.dart';
import '../../domain/student/student.dart';
import '../../domain/student/student_model.dart';
import '../api_constants.dart';
import '../base/base_repo.dart';
import 'i_student_repo.dart';

@Injectable(as: IStudentRepo)
class StudentRepo extends IStudentRepo with BaseRepo {
  @override
  Future<Either<ApiFailure, Student>> getStudentById(String studentId) {
    return super.get(
        '${ApiConstants.students}$studentId',
            (p0) => Student.fromJson(p0 as Map<String, dynamic>),
            (p0) => p0?['message'] ?? 'Something Went wrong');
  }

  @override
  Future<Either<ApiFailure, StudentModel>> getStudents() {
    return super.get(
        ApiConstants.subjects,
            (p0) => StudentModel.fromJson(p0 as Map<String, dynamic>),
            (p0) => p0?['message'] ?? 'Something Went wrong');
  }
}