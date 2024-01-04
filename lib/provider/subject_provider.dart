import 'package:flutter/material.dart';
import 'package:hamon_task/domain/subject/subject.dart';
import 'package:injectable/injectable.dart';

import '../infrastructure/subject/i_subject_repo.dart';

@injectable
class SubjectProvider with ChangeNotifier {
  ISubjectRepo subjectRepo;
  SubjectProvider({required this.subjectRepo});

  List<Subject>? subjects = [];
  Subject? subject;
  String message = "";
  bool isLoading = false;
  bool isError = false;
  Future<void> getSubjects() async {
    isError = false;
    isLoading = true;
    final result = await subjectRepo.getSubjects();
    isLoading = false;
    result.fold((l) {
      isError = true;
      return message = l.message;
    }, (r) {
      subjects?.addAll(r.subjects ?? []);
      notifyListeners();
    });
  }

  Future<void> getSubjectsById(String subjectId) async {
    final result = await subjectRepo.getSubjectById(subjectId);
    result.fold((l) => message = l.message, (r) => subject = r);
    notifyListeners();
  }

  String getSubjectName(String id)=>subjects!.firstWhere((element) => element.id.toString()==id).name??"";
  String getTeacherName(String id)=>subjects!.firstWhere((element) => element.id.toString()==id).teacher??"";
}
