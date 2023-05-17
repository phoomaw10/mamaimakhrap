import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:mamaimakhrap/CoursePage.dart';
import 'package:mamaimakhrap/QRCodePage.dart';
import 'package:mamaimakhrap/StudentHomePage.dart';
import 'package:mamaimakhrap/caller.dart';
import 'package:mamaimakhrap/model/histories.dart';
import 'package:mamaimakhrap/model/round.dart';
import 'package:mamaimakhrap/studentProfile.dart';

class InsideTeacherHistory extends StatefulWidget {
  const InsideTeacherHistory({super.key});

  @override
  State<InsideTeacherHistory> createState() => _InsideTeacherHistoryState();
}

class _InsideTeacherHistoryState extends State<InsideTeacherHistory> {
  double screenHeight = 0;
  double screenWidth = 0;
  late int id;
  String coursename = '';
  String courseinfo = '';
  String createdAt = '';
  int amountStudent = 0;
  List<HistoryRound> owner_people = [];

  List<Round> enrolled_courses = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      fetchData(context);
    });
  }

  void fetchData(BuildContext context) async {
    try {
      final id = ModalRoute.of(context)!.settings.arguments as int;
      Response response = await Caller.dio.get("/history/$id");
      print("Response Data");
      setState(() {
        List<dynamic> owner_student = response.data["histories"];
        owner_people =
            owner_student.map((json) => HistoryRound.fromJson(json)).toList();
        print("//////////////////");
        print(owner_people);
        Map<String, dynamic> courses = response.data["course"];
        Map<String, dynamic> roundInfo = response.data;
        print(response.data);
        coursename = courses['code'];
        courseinfo = courses['name'];
        createdAt = roundInfo['createdAt'];
        amountStudent = roundInfo['maxStudent'];
        print(coursename);
        print(courseinfo);
        print(createdAt);
        print(amountStudent);
      });
    } catch (e) {
      print(e);
    }
  }

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
              child: Row(children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, bottom: 4),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop((context));
                      },
                      icon: const Icon(
                        Icons.arrow_circle_left_rounded,
                        size: 40,
                        color: Color.fromARGB(255, 56, 56, 154),
                      )),
                ),
                const Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: Text(
                    "Attendance",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 5, 47, 109)),
                  ),
                )),
              ]),
            ),
          ),
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
                    Container(
                      margin: EdgeInsets.all(15.0),
                      child: SizedBox(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                coursename,
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 56, 56, 154),
                                ),
                              ),
                              subtitle: Text(courseinfo +
                                  "\n" +
                                  DateFormat('E, d MMM yyyy HH:mm:ss')
                                      .format(DateTime.parse(createdAt)) +
                                  "\n" +
                                  "Amount of Student = $amountStudent"),
                            )
                          ],
                        ),
                      ),
                    ),
                    Text('Checked-in Students'),
                    Container(
                      height: screenWidth - 40,
                      width: screenWidth - 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          children: owner_people
                              .map((e) => customMember(
                                  e.owner?.firstname ?? '',
                                  e.owner?.avatarURL ?? '',
                                  e.owner?.lastname ?? ''
                                  // e.enrollUser?.firstname as String,
                                  // e.enrollUser?.avatarURL as String
                                  ))
                              .toList(),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget customMember(String hint, String avatar, String lastname
      //String date,
      ) {
    return Column(
      children: [
        Container(
          width: screenWidth - 40,
          margin: const EdgeInsets.only(bottom: 10),
          child: Card(
            color: Color.fromARGB(255, 236, 242, 255),
            margin: const EdgeInsets.all(10),
            child: InkWell(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      radius: 23,
                      backgroundImage: NetworkImage(avatar),
                    ),
                    title: Text(
                      hint + ' ' + lastname,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
