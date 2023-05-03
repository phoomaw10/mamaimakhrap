import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mamaimakhrap/CoursePage.dart';
import 'package:mamaimakhrap/InsideTeacherHistory.dart';
import 'package:mamaimakhrap/QRCodePage.dart';
import 'package:mamaimakhrap/StudentHomePage.dart';
import 'package:mamaimakhrap/studentProfile.dart';

class TeacherHistory extends StatefulWidget {
  const TeacherHistory({super.key});

  @override
  State<TeacherHistory> createState() => _TeacherHistoryState();
}

class _TeacherHistoryState extends State<TeacherHistory> {
  double screenHeight = 0;
  double screenWidth = 0;
  Color primary = const Color.fromARGB(255, 177, 230, 252);
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 177, 230, 252),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          SizedBox(
              height: 100,
              width: screenWidth,
              child: Container(
                margin: const EdgeInsets.only(top: 40),
                child: const Center(
                  child: Text(
                    "History",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 5, 47, 109)),
                  ),
                ),
              )),
          Expanded(
            child: Container(
              height: screenHeight,
              width: screenWidth,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(children: [
                    customHistory(
                        'CSC111', 'Thursday 13 April 2023 13.30 - 16.30 pm'),
                    customHistory(
                        'CSC213', 'Thursday 13 April 2023 13.30 - 16.30 pm'),
                  ]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget customHistory(String title, String subtitle) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: ((context) => InsideTeacherHistory()))),
      child: Container(
        width: screenWidth - 40,
        margin: const EdgeInsets.only(bottom: 10),
        child: Card(
          color: const Color.fromARGB(255, 236, 242, 255),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 56, 56, 154),
                  ),
                ),
                subtitle: Text(subtitle),
              )
            ],
          ),
        ),
      ),
    );
  }
}
