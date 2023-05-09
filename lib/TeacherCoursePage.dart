import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mamaimakhrap/HistoryPage.dart';
import 'package:mamaimakhrap/InCoursePage.dart';
import 'package:mamaimakhrap/InsideCoursePage.dart';
import 'package:mamaimakhrap/QRCodePage.dart';
import 'package:mamaimakhrap/StudentHomePage.dart';
import 'package:mamaimakhrap/studentProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'caller.dart';
import 'model/QRCodeGenerator.dart';
import 'model/class.dart';

class TeacherCoursePage extends StatefulWidget {
  const TeacherCoursePage({super.key});

  @override
  State<TeacherCoursePage> createState() => _TeacherCoursePageState();
}

class _TeacherCoursePageState extends State<TeacherCoursePage> {
  String _qrData = '';
  double screenHeight = 0;
  double screenWidth = 0;
  List<Course> enrolled_courses = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      Response response = await Caller.dio.get("/course");
      setState(() {
        print(response.data);
        final List<dynamic> courses = response.data["created_courses"];
        for (var course in courses) {
          print(course);
          enrolled_courses.add(Course.fromJson(course));
        }
        print(enrolled_courses);
        // data = ClassList.fromJson(response.data["enrolled_courses"]);
        // final data = Profile.fromJson(response.data);
        // fname = data.firstname;
        // lastname = data.lastname;
        // email = data.email;
        // faculty = data.faculty;
        // department = data.department;
        // this.avatarUrl = data.avatarURL;
        // print(data.firstname);
      });
    } catch (e) {
      print(e);
    }
  }

  Color primary = const Color.fromARGB(255, 255, 255, 255);
  TextEditingController _textEditingController = TextEditingController();
  final CourseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 188, 153),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: screenWidth,
            child: Container(
              margin: const EdgeInsets.only(top: 40),
              child: const Center(
                child: Text(
                  "Course",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 5, 47, 109)),
                ),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: screenWidth,
                  height: screenHeight,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0))),
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                          children: enrolled_courses
                              .map((e) => customCourse(e.id, e.code, e.name))
                              .toList()),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: FloatingActionButton(
                    child: Icon(Icons.create),
                    backgroundColor: Color.fromARGB(255, 255, 188, 153),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            title: const Text(
                              'Create Course',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 5, 47, 109)),
                            ),
                            content: TextField(
                              controller: _textEditingController,
                              decoration:
                                  InputDecoration(hintText: "Course Name"),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text(
                                  'Close',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 56, 56, 154),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: BorderSide(
                                    color: Color.fromARGB(255, 56, 56, 154),
                                    width: 1,
                                  ),
                                ),
                              ),
                              TextButton(
                                child: Text(
                                  'Create',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 56, 56, 154),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget customCourse(int id, String title, String subtitle) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => InCoursePage()),
          settings: RouteSettings(
            arguments: id,
          ),
        ),
      ),
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
