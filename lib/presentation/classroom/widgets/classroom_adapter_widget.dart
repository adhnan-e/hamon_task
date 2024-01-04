import 'package:flutter/material.dart';
import 'package:hamon_task/domain/classroom/classroom.dart';

import '../../../domain/student_model/student.dart';

class ClassroomAdapterWidget extends StatelessWidget {
  const ClassroomAdapterWidget(
      {super.key, required this.classroom, this.onTap});
  final Classroom classroom;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(child: Text("${classroom.id}")),
      title: Text("${classroom.name}",
          style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text("${classroom.layout}"),
      trailing: Text("Head Count:${classroom.size}"),
    );
  }
}
