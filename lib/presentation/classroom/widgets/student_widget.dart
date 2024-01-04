import 'package:flutter/material.dart';

class StudentWidget extends StatelessWidget {
  const StudentWidget({super.key, required this.rollNo});
final String rollNo;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Container(
          decoration:  BoxDecoration(
              color:Colors.white70,
              border: Border.all(color: Colors.black),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Center(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(rollNo,style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.normal)),
              const Text("Student",style: TextStyle(color: Colors.grey,fontSize: 8,fontWeight: FontWeight.normal)),
            ],
          )),

        ),
      ),
    );
  }
}
