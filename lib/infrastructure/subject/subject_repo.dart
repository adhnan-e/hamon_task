import 'package:dartz/dartz.dart';
import 'package:hamon_task/domain/api_failure.dart';
import 'package:hamon_task/domain/subject/subject.dart';
import 'package:hamon_task/domain/subject/subject_model.dart';
import 'package:hamon_task/infrastructure/api_constants.dart';
import 'package:injectable/injectable.dart';

import '../base/base_repo.dart';
import 'i_subject_repo.dart';

@Injectable(as: ISubjectRepo)
class SubjectRepo extends ISubjectRepo with BaseRepo {
  @override
  Future<Either<ApiFailure, Subject>> getSubjectById(String subjectId) {
    return super.get(
        '${ApiConstants.subjects}$subjectId',
            (p0) => Subject.fromJson(p0 as Map<String, dynamic>),
            (p0) => p0?['message'] ?? 'Something Went wrong');
  }

  @override
  Future<Either<ApiFailure, SubjectModel>> getSubjects() {
    return super.get(
        ApiConstants.subjects,
            (p0) => SubjectModel.fromJson(p0 as Map<String, dynamic>),
            (p0) => p0?['message'] ?? 'Something Went wrong');
  }
}