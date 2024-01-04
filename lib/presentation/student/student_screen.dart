import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/student_model/student.dart';
import '../../provider/student_provider.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(title: Text("${provider.student?.name}")),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5, right: 16, bottom: 5),
                    child: const CircleAvatar(
                      minRadius: 60,
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1495995424756-6a5a3f9e7543?q=80&w=2676&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text("${provider.student?.id}",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 14,
                  ),
                  Text("${provider.student?.name}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Text("${provider.student?.email}",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal)),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Age: ${provider.student?.age}",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal)),
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
