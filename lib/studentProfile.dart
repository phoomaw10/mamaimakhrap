import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mamaimakhrap/CoursePage.dart';
import 'package:mamaimakhrap/HistoryPage.dart';
import 'package:mamaimakhrap/QRCodePage.dart';
import 'package:mamaimakhrap/StudentHomePage.dart';
import 'package:mamaimakhrap/auth_service.dart';
import 'package:mamaimakhrap/loginscreen.dart';
import 'package:mamaimakhrap/splash_screen.dart';

class studentProfile extends StatefulWidget {
  const studentProfile({super.key});

  @override
  State<studentProfile> createState() => _studentProfile();
}

class _studentProfile extends State<studentProfile> {
  double screenHeight = 0;
  double screenWidth = 0;
  final users = FirebaseAuth.instance.currentUser;

  Color primary = const Color.fromARGB(255, 255, 255, 255);
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 191, 134),
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
                    "Student",
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
                    margin:
                        const EdgeInsets.only(top: 10, right: 10, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  title: const Text(
                                    'Logout',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 5, 47, 109)),
                                  ),
                                  content:
                                      const Text('Are you sure to logout?'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text(
                                        'No',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                255, 56, 56, 154)),
                                      ),
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 56, 56, 154),
                                          width: 1,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: const Text(
                                        'Yes',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 56, 56, 154),
                                      ),
                                      onPressed: () {
                                        AuthService().signOut();
                                        Navigator.of(context).pop();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SplashScreen()));
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.logout_rounded),
                          color: const Color.fromARGB(255, 55, 56, 128),
                          iconSize: screenWidth / 10,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Column(children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('images/face.jpeg'),
                        radius: 100,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 40, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              "First name",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      customField('Nawat'),
                      Container(
                        margin: const EdgeInsets.only(left: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              "Last name",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      customField('Sujjaritrat'),
                      Container(
                        margin: const EdgeInsets.only(left: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              "Faculty",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      customField('School of Information Technology'),
                      Container(
                        margin: const EdgeInsets.only(left: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              "Department",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      customField('Computer Science'),
                      Container(
                        margin: const EdgeInsets.only(left: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              "Email",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      customField('nawat.sujj@kmutt.ac.th'),
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
  ) {
    return Container(
        width: screenWidth - 80,
        height: screenHeight / 17,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 236, 242, 255),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(181, 214, 213, 213),
                spreadRadius: 0.1,
                blurRadius: 0.5,
                offset: Offset(0, 5),
              ),
              BoxShadow(
                color: Colors.white70,
                offset: Offset(-5, 0),
              ),
              BoxShadow(
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
