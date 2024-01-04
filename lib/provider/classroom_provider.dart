import 'package:flutter/material.dart';
import 'package:hamon_task/domain/classroom/classroom.dart';
import 'package:injectable/injectable.dart';
import '../domain/single_classroom/single_classroom.dart';
import '../infrastructure/classroom/i_classroom_repo.dart';

@injectable
class ClassroomProvider with ChangeNotifier {
  IClassroomRepo classroomRepo;
  ClassroomProvider({required this.classroomRepo});
  List<Classroom>? classrooms = [];
  bool isLoading = false;
  bool isError = false;
  int? classroomId;
  SingleClassroom? classroom;
  String message = "";
  Future<void> getClassrooms() async {
    isError = false;
    isLoading = true;
    final result = await classroomRepo.getClassrooms();
    isLoading = false;
    result.fold((l) {
      isError = true;
      return message = l.message;
    }, (r) {
      classrooms?.clear();
      classrooms?.addAll(r.classrooms ?? []);
      notifyListeners();
    });
  }

  Future<void> getClassroomById(String classroomId) async {
    isError = false;
    isLoading = true;
    final result = await classroomRepo.getClassroomById(classroomId);

    isLoading = false;
    result.fold((l) {
      isError = true;
      return message = l.message;
    }, (r) => classroom = r);
    notifyListeners();
  }

  Future<void> setAssignSubject(int subjectId) async {
    isError = false;
    isLoading = true;
    final result = await classroomRepo.setAssignSubject(subjectId,classroom!.id.toString());

    isLoading = false;
    result.fold((l) {
      isError = true;
      return message = l.message;
    }, (r) => getClassroomById(classroom!.id.toString()));
    notifyListeners();
  }
  Map<String, int> splitNumber(int number) {
    int half = (number / 2).floor();
    return {'Left': half, 'Right': number - half};
  }
}
