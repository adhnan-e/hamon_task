import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../infrastructure/subject/i_subject_repo.dart';

@injectable
class SubjectProvider with ChangeNotifier {
  ISubjectRepo subjectRepo;
  SubjectProvider({required this.subjectRepo});
}
