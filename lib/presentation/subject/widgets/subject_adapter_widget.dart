import 'package:flutter/material.dart';
import 'package:hamon_task/domain/subject/subject.dart';

import '../../../domain/student_model/student.dart';

class SubjectAdapterWidget extends StatelessWidget {
  const SubjectAdapterWidget({super.key, required this.subject, this.onTap});
  final Subject subject;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Column(
        children: [
          CircleAvatar(
              child:
                  Text("${subject.credits}", style: TextStyle(fontSize: 14))),
          SizedBox(
            height: 4,
          ),
          const Text(
            "Credits",
            style: TextStyle(fontSize: 8),
          )
        ],
      ),
      title: Text("${subject.name}",
          style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text("${subject.teacher}"),
    );
  }
}
