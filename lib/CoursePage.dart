import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  double screenHeight = 0;
  double screenWidth = 0;
  Color primary = const Color.fromARGB(255, 255, 255, 255);
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
                          child: TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                                overlayColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.hovered))
                                      return Colors.blue.withOpacity(0.04);
                                    if (states
                                            .contains(MaterialState.focused) ||
                                        states.contains(MaterialState.pressed))
                                      return Colors.blue.withOpacity(0.12);
                                    return null; // Defer to the widget's default.
                                  },
                                ),
                              ),
                              onPressed: () {},
                              child: Text('TextButton')))
                    ]),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    width: screenWidth - 60,
                    height: screenHeight / 12,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 236, 242, 255),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.book),
                          iconSize: 30,
                          color: const Color.fromARGB(255, 55, 56, 128),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.history),
                          iconSize: 30,
                          color: const Color.fromARGB(255, 55, 56, 128),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.home),
                          iconSize: 30,
                          color: const Color.fromARGB(255, 55, 56, 128),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.qr_code),
                          iconSize: 30,
                          color: const Color.fromARGB(255, 55, 56, 128),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.person),
                          iconSize: 30,
                          color: const Color.fromARGB(255, 55, 56, 128),
                        ),
                      ],
                    ),
                  )
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
  ) {
    return Container(
        width: screenWidth - 80,
        height: screenHeight / 17,
        margin: const EdgeInsets.only(bottom: 7),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 236, 242, 255),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(181, 214, 213, 213),
                spreadRadius: 0.1,
                blurRadius: 0.5,
                offset: const Offset(0, 5),
              ),
              const BoxShadow(
                color: Colors.white70,
                offset: Offset(-5, 0),
              ),
              const BoxShadow(
                color: Colors.white70,
                offset: Offset(5, 0),
              )
            ]),
        child: Container(
          margin: const EdgeInsets.only(left: 25),
          child: Row(
            children: [
              Text(
                hint,
                style: const TextStyle(color: Color.fromARGB(158, 0, 0, 0)),
              )
            ],
          ),
        ));
  }
}
