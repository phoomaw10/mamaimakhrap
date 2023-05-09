import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mamaimakhrap/CoursePage.dart';
import 'package:mamaimakhrap/HistoryPage.dart';
import 'package:mamaimakhrap/InsideFeedbackPage.dart';
import 'package:mamaimakhrap/QRCodePage.dart';
import 'package:mamaimakhrap/StudentHomePage.dart';
import 'package:mamaimakhrap/model/feedback.dart';
import 'package:mamaimakhrap/studentProfile.dart';

import 'caller.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  List<FeedbackList> get_Feedback = [];
  double screenHeight = 0;
  double screenWidth = 0;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      Response response = await Caller.dio.get("/feedbacks");
      setState(() {
        print(response.data);
        final List<dynamic> feedbacks = response.data;
        print("arrrrrr" + feedbacks.toString());
        for (var feedback in feedbacks) {
          get_Feedback.add(FeedbackList.fromJson(feedback));
        }
        // print('feed bacsadasdasd ' + get_Feedback.toString());
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

  Color primary = const Color.fromARGB(255, 177, 230, 252);
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
                child: const Center(
                  child: Text(
                    "Feedback",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 5, 47, 109)),
                  ),
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
                    child: Column(
                        children: get_Feedback
                            .map((e) => customField(e.id, 'aaaa', 'dddd'))
                            .toList()),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget customField(
    int id,
    String hint,
    String date,
  ) {
    return Column(children: [
      GestureDetector(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: ((context) => InsideFeedbackPage()))),
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
                        leading: Icon(
                          Icons.local_post_office_rounded,
                          color: Colors.black,
                          size: screenWidth / 10,
                        ),
                        title: Text(
                          hint,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 56, 56, 154),
                          ),
                        ),
                        subtitle: Text(date),
                      )
                    ]))),
      )
    ]);
  }
}
