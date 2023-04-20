import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mamaimakhrap/CoursePage.dart';

class InsideCoursePage extends StatefulWidget {
  const InsideCoursePage({super.key});

  @override
  State<InsideCoursePage> createState() => _InsideCoursePageState();
}

class _InsideCoursePageState extends State<InsideCoursePage> {
  double screenHeight = 0;
  double screenWidth = 0;
  Color primary = const Color.fromARGB(255, 255, 255, 255);
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 188, 153),
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
                        "Course",
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
                            subtitle: Text('User-Centered Mobile Application'),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: SizedBox(
                      child: Column(
                        children: const <Widget>[
                          ListTile(
                            title: Text(
                              'Class History',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 56, 56, 154),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: screenWidth - 40,
                    width: screenWidth - 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(255, 236, 242, 255),
                    ),
                    child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            customField('CSC234',
                                'Thursday 13 April 2023 13.30 - 16.30'),
                            customField('CSC234',
                                'Thursday 20 April 2023 13.30 - 16.30'),
                            customField('CSC234',
                                'Thursday 27 April 2023 13.30 - 16.30'),
                            customField('CSC234',
                                'Thursday 27 April 2023 13.30 - 16.30')
                          ],
                        )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Widget customField(
    String hint,
    String date,
  ) {
    return Column(children: [
      Container(
          width: screenWidth - 85,
          margin: const EdgeInsets.only(bottom: 10),
          child: Card(
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.check_circle_rounded,
                        color: Colors.green,
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
                  ])))
    ]);
  }
}
