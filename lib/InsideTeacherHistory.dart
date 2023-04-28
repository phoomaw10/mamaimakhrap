import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mamaimakhrap/CoursePage.dart';
import 'package:mamaimakhrap/QRCodePage.dart';
import 'package:mamaimakhrap/StudentHomePage.dart';
import 'package:mamaimakhrap/studentProfile.dart';

class InsideTeacherHistory extends StatefulWidget {
  const InsideTeacherHistory({super.key});

  @override
  State<InsideTeacherHistory> createState() => _InsideTeacherHistoryState();
}

class _InsideTeacherHistoryState extends State<InsideTeacherHistory> {
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
                          children: const <Widget>[
                            ListTile(
                              title: Text(
                                'CSC234',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 56, 56, 154),
                                ),
                              ),
                              subtitle: Text(
                                  'User-Centered Mobile Application\nThursday 13 April 2023\n13.30 - 16.30 PM'),
                            )
                          ],
                        ),
                      ),
                    ),
                    customMember('Nawat Sujjaritrat'),
                    customMember('Panusorn Roeksukrungrueang'),
                    customMember('Puvadet Niyomdaychar'),
                    customMember('Thanadol Saojakaval'),
                  ]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget customMember(
    String hint,
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
                      backgroundImage: AssetImage("images/face.jpeg"),
                    ),
                    title: Text(
                      hint,
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
