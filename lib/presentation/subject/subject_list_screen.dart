import 'package:flutter/material.dart';
import 'package:hamon_task/presentation/subject/widgets/subject_adapter_widget.dart';
import 'package:provider/provider.dart';

import '../../navigation/route_constants.dart';
import '../../provider/subject_provider.dart';

class SubjectListScreen extends StatefulWidget {
  const SubjectListScreen({super.key});

  @override
  State<SubjectListScreen> createState() => _SubjectListScreenState();
}

class _SubjectListScreenState extends State<SubjectListScreen> {
  void initState() {
    Provider.of<SubjectProvider>(context, listen: false).getSubjects();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Subject List")),
      body: Consumer<SubjectProvider>(
        builder: (context, provider, child) {
          print("${provider.subjects?.length}");
          return provider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  itemCount: provider.subjects?.length ?? 0,
                  itemBuilder: (context, index) {
                    return SubjectAdapterWidget(
                        onTap: () {
                          provider.subject = provider.subjects![index];
                          Navigator.of(context)
                              .pushNamed(RouteConstants.subjects);
                        },
                        subject: provider.subjects![index]);
                  },
                  separatorBuilder: (context, index) => const Divider(),
                );
        },
      ),
    );
  }
}
