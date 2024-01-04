import 'package:flutter/material.dart';

import '../../../domain/student_model/student.dart';

class StudentAdapterWidget extends StatelessWidget {
  const StudentAdapterWidget({super.key, required this.student, this.onTap});
  final Student student;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(child: Text("${student.id}")),
      title: Text("${student.name}",
          style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text("${student.email}"),
      trailing: Text("Age:${student.age}"),
    );
  }
}
