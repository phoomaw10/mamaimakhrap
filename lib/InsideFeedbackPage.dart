import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mamaimakhrap/model/feedback.dart';

import 'caller.dart';

class InsideFeedbackPage extends StatefulWidget {
  const InsideFeedbackPage({super.key});

  @override
  State<InsideFeedbackPage> createState() => _InsideFeedbackPageState();
}

class _InsideFeedbackPageState extends State<InsideFeedbackPage> {
  late int id;
  String name = '';
  String code = '';
  String join_code = '';
  double screenHeight = 0;
  double screenWidth = 0;
  String feedbackText = '';
  String teacherName = '';
  String avatarUrl = '';
  Color primary = const Color.fromARGB(255, 177, 230, 252);
  String createdAt = "";
  List<FeedbackList> course_rounds = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      fetchData(context);
    });
  }

  void fetchData(BuildContext context) async {
    try {
      // final routeArguments =
      //     ModalRoute.of(context)!.settings.arguments as Map<String, int>;
      // final id = routeArguments["id"];
      // print("Id of course " + id.toString());
      // print('arguments');
      // print(routeArguments);
      final id = ModalRoute.of(context)!.settings.arguments as int;
      Response response = await Caller.dio.get("/feedbacks/$id");
      print(response.data);
      setState(() {
        // final List<dynamic> courses = response.data["course_rounds"];
        // for (var course in courses) {
        //   course_rounds.add(Course.fromJson(course));
        // }
        print(course_rounds);
        // final List<dynamic> courses = response.data;
        // for (var course in courses) {
        //   course_rounds.add(Course.fromJson(course));
        // }

        // print(courses);
        print(1);
        Map<String, dynamic> courses = response.data["course"];
        Map<String, dynamic> teacher = response.data["teacher"];
        Map<String, dynamic> fetchCourse = response.data;
        print(12131);
        // name = fetchCourse['name'];
        // code = fetchCourse['code'];
        // join_code = fetchCourse['join_code'];
        createdAt = fetchCourse['createdAt'];
        feedbackText = fetchCourse['feedbackText'];
        code = courses['code'];
        teacherName = teacher['firstname'];
        avatarUrl = teacher['avatar_url'];
        print(fetchCourse);

        // for (var course in courses) {
        //   course_rounds.add(FeedbackList.fromJson(course));
        // }
        print(course_rounds);

        print('awdwadwad');
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 181, 236, 205),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          SizedBox(
              height: 100,
              width: screenWidth,
              child: Container(
                margin: const EdgeInsets.only(top: 40),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 10, bottom: 4),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
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
                        "Feedback",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 5, 47, 109)),
                      ),
                    ))
                  ],
                ),
              )),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin:
                        const EdgeInsets.only(top: 10, right: 10, bottom: 20),
                  ),
                  SizedBox(
                    height: screenHeight / 1.4,
                    child: Column(children: [
                      Container(
                        margin: const EdgeInsets.only(left: 30, top: 10),
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: NetworkImage(avatarUrl),
                              radius: 50,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 30),
                              child: Column(children: [
                                RichText(
                                    text: TextSpan(
                                        text: code + '\n',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 56, 56, 154)),
                                        children: [
                                      TextSpan(
                                          text: 'Feedback from ' + teacherName,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  149, 56, 56, 154)))
                                    ]))
                              ]),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: screenHeight - 500,
                        width: screenWidth - 40,
                        margin: const EdgeInsets.only(top: 20),
                        decoration: const BoxDecoration(
                            color: const Color.fromARGB(255, 236, 242, 255),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                            margin: const EdgeInsets.only(top: 10, left: 10),
                            child: Text(feedbackText)),
                      )
                    ]),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
