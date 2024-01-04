import 'package:flutter/material.dart';
import 'package:hamon_task/presentation/student/widgets/student_adapter_widget.dart';
import 'package:provider/provider.dart';

import '../../navigation/route_constants.dart';
import '../../provider/student_provider.dart';

class StudentsListScreen extends StatefulWidget {
  const StudentsListScreen({super.key});

  @override
  State<StudentsListScreen> createState() => _StudentsListScreenState();
}

class _StudentsListScreenState extends State<StudentsListScreen> {
  @override
  void initState() {
    Provider.of<StudentProvider>(context, listen: false).getStudents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Students List")),
      body: Consumer<StudentProvider>(
        builder: (context, provider, child) {
          return provider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  itemCount: provider.students?.length ?? 0,
                  itemBuilder: (context, index) {
                    return StudentAdapterWidget(
                        onTap: () {
                          provider.student = provider.students![index];
                          Navigator.of(context)
                              .pushNamed(RouteConstants.students);
                        },
                        student: provider.students![index]);
                  },
                  separatorBuilder: (context, index) => const Divider(),
                );
        },
      ),
    );
  }
}
