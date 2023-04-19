import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class InsideFeedbackPage extends StatefulWidget {
  const InsideFeedbackPage({super.key});

  @override
  State<InsideFeedbackPage> createState() => _InsideFeedbackPageState();
}

class _InsideFeedbackPageState extends State<InsideFeedbackPage> {
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
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 10, bottom: 15),
                      child: IconButton(
                          onPressed: () {},
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
                            const CircleAvatar(
                              backgroundImage: AssetImage('images/face.jpeg'),
                              radius: 50,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 30),
                              child: Column(children: [
                                RichText(
                                    text: const TextSpan(
                                        text: 'CSC234\n',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(255, 56, 56, 154)),
                                        children: [
                                      TextSpan(
                                          text: 'Feedback from Aj.Vajirasak',
                                          style: TextStyle(fontSize: 15, color: Color.fromARGB(149, 56, 56, 154)))
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
                          child: Text('This is your feedback')),
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
