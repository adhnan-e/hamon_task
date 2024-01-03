import 'package:flutter/material.dart';

import '../../../domain/student_model/student.dart';


class StudentAdapterWidget extends StatelessWidget {
  const StudentAdapterWidget({super.key, required this.student});
  final Student student;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text("${student.id}")),
      title: Text("${student.name}"),
      subtitle: Text("${student.email}"),
      trailing: Text("Age:${student.age}"),
    );
  }
}
