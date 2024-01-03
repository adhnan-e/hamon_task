import 'package:flutter/material.dart';
import 'package:hamon_task/presentation/home/widgets/home_adapter_widget.dart';

import '../../navigation/route_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.grey,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.grey, size: 28),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.grey,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, right: 16, bottom: 5),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1500522144261-ea64433bbe27?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTh8fHdvbWVufGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            RichText(
              text: const TextSpan(
                text: "Hello ",
                style: TextStyle(color: Colors.blue, fontSize: 20),
                children: [
                  TextSpan(
                    text: "HAMON",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ", welcome back!",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "My Department",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Text(
                  "View All",
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
            HomeAdapterWidget(
                onTap: () {
                  Navigator.of(context).pushNamed(RouteConstants.classroomList);
                },
                color: Colors.blueAccent,
                image: 'assets/classroom.png',
                title: "Classroom"),
            HomeAdapterWidget(
                onTap: () {
                  Navigator.of(context).pushNamed(RouteConstants.studentsList);
                },
                color: Colors.orange,
                image: 'assets/students.png',
                title: "Students"),
            HomeAdapterWidget(
                onTap: () {
                  Navigator.of(context).pushNamed(RouteConstants.subjectsList);
                },
                color: Colors.green,
                image: 'assets/teacher.png',
                title: "Subjects"),
          ]),
        ),
      ),
    );
  }
}
