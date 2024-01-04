import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/subject_provider.dart';

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SubjectProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(title: Text("${provider.subject?.name}")),
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
                          "https://images.unsplash.com/photo-1495446815901-a7297e633e8d?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text("${provider.subject?.id}",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 14,
                  ),
                  Text("${provider.subject?.name}",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Text("${provider.subject?.teacher}",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal)),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Credits: ${provider.subject?.credits}",
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
