import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/api_failure.dart';
import '../../domain/classroom/classroom.dart';
import '../../domain/classroom/classroom_model.dart';
import '../api_constants.dart';
import '../base/base_repo.dart';
import 'i_classroom_repo.dart';

@Injectable(as: IClassroomRepo)
class StudentRepo extends IClassroomRepo with BaseRepo {
  @override
  Future<Either<ApiFailure, Classroom>> getClassroomById(String classroomId) {
    return super.get(
        '${ApiConstants.classrooms}$classroomId',
            (p0) => Classroom.fromJson(p0 as Map<String, dynamic>),
            (p0) => p0?['message'] ?? 'Something Went wrong');
  }

  @override
  Future<Either<ApiFailure, ClassroomModel>> getClassrooms() {
    return super.get(
        ApiConstants.subjects,
            (p0) => ClassroomModel.fromJson(p0 as Map<String, dynamic>),
            (p0) => p0?['message'] ?? 'Something Went wrong');
  }
}