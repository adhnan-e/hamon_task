import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../navigation/route_constants.dart';
import '../../provider/classroom_provider.dart';
import 'widgets/classroom_adapter_widget.dart';

class ClassroomListScreen extends StatefulWidget {
  const ClassroomListScreen({super.key});

  @override
  State<ClassroomListScreen> createState() => _ClassroomListScreenState();
}

class _ClassroomListScreenState extends State<ClassroomListScreen> {
  @override
  void initState() {
    Provider.of<ClassroomProvider>(context, listen: false).getClassrooms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ClassRoom List")),
      body: Consumer<ClassroomProvider>(
        builder: (context, provider, child) {
          print("${provider.classrooms?.length}");
          return provider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  itemCount: provider.classrooms?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ClassroomAdapterWidget(
                        onTap: () {
                          provider.classroomId = provider.classrooms![index].id;
                          Navigator.of(context)
                              .pushNamed(RouteConstants.classroom);
                        },
                        classroom: provider.classrooms![index]);
                  },
                  separatorBuilder: (context, index) => const Divider(),
                );
        },
      ),
    );
  }
}
