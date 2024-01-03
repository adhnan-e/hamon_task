import 'package:dartz/dartz.dart';

import '../../domain/api_failure.dart';
import '../../domain/subject/subject.dart';
import '../../domain/subject/subject_model.dart';

abstract class ISubjectRepo {
  Future<Either<ApiFailure, SubjectModel>> getSubjects();
  Future<Either<ApiFailure, Subject>> getSubjectById(String subjectId);
}