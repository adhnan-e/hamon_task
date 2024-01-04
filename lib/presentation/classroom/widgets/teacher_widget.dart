import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/subject/subject.dart';
import '../../../provider/subject_provider.dart';

class TeacherWidget extends StatelessWidget {
  const TeacherWidget({super.key, required this.subject});
  final String subject;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 120.0,
        height: 60.0,
        decoration: BoxDecoration(
            color: subject == "Not Assigned" ? Colors.grey : Colors.teal,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Consumer<SubjectProvider>(
          builder: (context, provider, child) {


            print("gggggg: ${provider.subjects?.length}:${provider.isLoading} ");
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  subject != "Not Assigned"
                      ? provider.getSubjectName(subject)
                      : subject,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  subject != "Not Assigned"
                      ? provider.getTeacherName(subject)
                      : subject,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.normal),
                ),

              ],
            );
          },
        ),
      ),
    );
  }
}
