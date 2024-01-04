import 'package:flutter/material.dart';
import 'package:hamon_task/presentation/classroom/widgets/classroom_layout_widget.dart';
import 'package:hamon_task/presentation/classroom/widgets/classroon_board_widget.dart';
import 'package:hamon_task/presentation/classroom/widgets/conference_layout_widget.dart';
import 'package:hamon_task/presentation/classroom/widgets/teacher_widget.dart';
import 'package:hamon_task/presentation/subject/widgets/subject_adapter_widget.dart';
import 'package:provider/provider.dart';
import '../../provider/classroom_provider.dart';
import '../../provider/subject_provider.dart';

class ClassroomScreen extends StatefulWidget {
  const ClassroomScreen({super.key});

  @override
  State<ClassroomScreen> createState() => _ClassroomScreenState();
}

class _ClassroomScreenState extends State<ClassroomScreen> {
  ClassroomProvider? classroomProvider;
  @override
  void initState() {
    classroomProvider=Provider.of<ClassroomProvider>(context, listen: false);
    classroomProvider?.getClassroomById(classroomProvider!.classroomId.toString());
    Provider.of<SubjectProvider>(context, listen: false).getSubjects();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ClassroomProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
              title: Text(
                  "${provider.isLoading ? "Loading..." : provider.classroom?.name}")),
          body: provider.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100.0, 20, 100.0, 0),
                    child: AspectRatio(
                      aspectRatio: 320 / 20,
                      child: CustomPaint(
                        painter: CurveScreenPainter(),
                      ),
                    ),
                  ),
                  const Text("Green Board here"),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: () {
                        _showYesNoAlert(context);
                      },
                      child: TeacherWidget(
                          subject: (provider.classroom?.subject.toString()) != ""
                              ? (provider.classroom?.subject).toString()
                              : "Not Assigned")),
                  Expanded(
                      child: provider.classroom?.layout == "classroom"
                          ? ClassroomLayoutWidget(
                              layout: provider
                                  .splitNumber(provider.classroom?.size ?? 0))
                          : ConferenceLayoutWidget(
                              layout: provider
                                  .splitNumber(provider.classroom?.size ?? 0),
                            ))
                ]),
        );
      },
    );
  }

  void _showYesNoAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Assign a teacher'),
          content: SizedBox(
            height: 400,
            width: 300,
            child: Consumer<SubjectProvider>(
              builder: (context, provider, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.subjects?.length,
                  itemBuilder: (context, index) => SubjectAdapterWidget(
                    onTap: () {
                       classroomProvider?.setAssignSubject(provider.subjects![index].id!);
                      Navigator.of(context).pop();
                    },
                    subject: provider.subjects![index],),
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
