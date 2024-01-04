import 'package:flutter/material.dart';
import 'package:hamon_task/presentation/classroom/widgets/student_widget.dart';

class ConferenceLayoutWidget extends StatelessWidget {
  const ConferenceLayoutWidget({super.key, required this.layout});
  final Map<String,int> layout;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: layout["Left"],
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1),
              itemBuilder: (context, index) {
                return StudentWidget(rollNo: (index+1).toString());
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width/2+10,
              height: MediaQuery.of(context).size.height-250,
              decoration:  BoxDecoration(
                  border: Border.all(color: Colors.grey,width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),


            ),
          ),
          Expanded(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: layout["Right"],
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1),
              itemBuilder: (context, index) {
                return StudentWidget(rollNo: (layout["Left"]!+index+1).toString());
              },
            ),
          ),
        ],
      ),
    );  }
}

