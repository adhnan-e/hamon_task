import 'package:dartz/dartz.dart';

import '../../domain/api_failure.dart';
import '../../domain/classroom/classroom.dart';
import '../../domain/classroom/classroom_model.dart';
import '../../domain/single_classroom/single_classroom.dart';

abstract class IClassroomRepo {
  Future<Either<ApiFailure, ClassroomModel>> getClassrooms();
  Future<Either<ApiFailure, SingleClassroom>> getClassroomById(String classroomId);
  Future<Either<ApiFailure, String>> setAssignSubject(int subjectId,String classroomId);
}
