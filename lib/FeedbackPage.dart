import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mamaimakhrap/CoursePage.dart';
import 'package:mamaimakhrap/HistoryPage.dart';
import 'package:mamaimakhrap/QRCodePage.dart';
import 'package:mamaimakhrap/StudentHomePage.dart';
import 'package:mamaimakhrap/studentProfile.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
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
                    child: Column(children: [
                      customField('CSC111', 'Feedback from Aj.Vajirasak'),
                      customField('CSC213', 'Feedback from Aj.Narongrit'),
                      customField('CSC102', 'Feedback from Aj.Chonlamet')
                    ]),
                  ),
                  navigatebar()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget navigatebar() {
    return Container(
      width: screenWidth - 60,
      height: screenHeight / 12,
      margin: EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 236, 242, 255),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const CoursePage())));
            },
            icon: const Icon(Icons.book),
            iconSize: 30,
            color: const Color.fromARGB(255, 55, 56, 128),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const HistoryPage())));
            },
            icon: const Icon(Icons.history),
            iconSize: 30,
            color: const Color.fromARGB(255, 55, 56, 128),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const StudentHomePage())));
            },
            icon: const Icon(Icons.home),
            iconSize: 30,
            color: const Color.fromARGB(255, 55, 56, 128),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const QRCodePage())));
            },
            icon: const Icon(Icons.qr_code),
            iconSize: 30,
            color: const Color.fromARGB(255, 55, 56, 128),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const studentProfile())));
            },
            icon: const Icon(Icons.person),
            iconSize: 30,
            color: const Color.fromARGB(255, 55, 56, 128),
          ),
        ],
      ),
    );
  }

  Widget customField(
    String hint,
    String date,
  ) {
    return Column(children: [
      GestureDetector(
        onTap: () => print("tapped"),
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
