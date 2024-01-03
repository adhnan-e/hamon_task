import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../infrastructure/classroom/i_classroom_repo.dart';

@injectable
class ClassroomProvider with ChangeNotifier {
  IClassroomRepo classroomRepo;
  ClassroomProvider({required this.classroomRepo});
}
