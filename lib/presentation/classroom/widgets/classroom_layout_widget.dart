import 'package:flutter/cupertino.dart';
import 'package:hamon_task/presentation/classroom/widgets/student_widget.dart';

class ClassroomLayoutWidget extends StatelessWidget {
  const ClassroomLayoutWidget({super.key, required this.layout});
final Map<String,int> layout;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: layout["Left"],
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return StudentWidget(rollNo: (index+1).toString());
              },
            ),
          ),

          const SizedBox(width: 80,),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: layout["Right"],
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return StudentWidget(rollNo: (layout["Left"]!+index+1).toString());
              },
            ),
          ),
        ],
      ),
    );
  }
}
