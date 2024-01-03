import 'package:dartz/dartz.dart';

import '../../domain/api_failure.dart';
import '../../domain/classroom/classroom.dart';
import '../../domain/classroom/classroom_model.dart';

abstract class IClassroomRepo {
  Future<Either<ApiFailure, ClassroomModel>> getClassrooms();
  Future<Either<ApiFailure, Classroom>> getClassroomById(String classroomId);
}
