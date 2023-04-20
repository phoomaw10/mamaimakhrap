import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:mamaimakhrap/CoursePage.dart';
import 'package:mamaimakhrap/FeedbackPage.dart';
import 'package:mamaimakhrap/HistoryPage.dart';
import 'package:mamaimakhrap/QRCodePage.dart';
import 'package:mamaimakhrap/studentProfile.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({Key? key}) : super(key: key);

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  double screenHeight = 0;
  double screenWidth = 0;
  Color primary = Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primary,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                      'images/face.jpeg',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Nawat Sujjaritrat",
                    style: TextStyle(
                      fontSize: screenWidth / 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 56, 56, 154),
                    ),
                  ),
                  Text(
                    "64130500236",
                    style: TextStyle(
                      fontSize: screenWidth / 30,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40),
          Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const CoursePage())));
                    },
                    icon: Column(
                      children: [
                        Icon(Icons.book, size: 50),
                        Text(
                          "Class",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    label: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(150, 150)),
                      textStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 18)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 255, 189, 153),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(width: 50),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const QRCodePage())));
                    },
                    icon: Column(
                      children: [
                        Icon(Icons.qr_code, size: 50), // <-- Icon
                        Text(
                          "QR Code",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    label: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(150, 150)),
                      textStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 18)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 202, 189, 255),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              )),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const HistoryPage())));
                },
                icon: Column(
                  children: [
                    Icon(Icons.history, size: 50), // <-- Icon
                    Text(
                      "History",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                label: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                  minimumSize: MaterialStateProperty.all(Size(150, 150)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 18)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 177, 230, 252),
                  ),
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(width: 50),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const studentProfile())));
                },
                icon: Column(
                  children: [
                    Icon(Icons.account_circle, size: 50), // <-- Icon
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                label: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                  minimumSize: MaterialStateProperty.all(Size(150, 150)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 18)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 255, 215, 141),
                  ),
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const FeedbackPage())));
            },
            icon: Column(
              children: [
                Icon(Icons.assignment_rounded, size: 50), // <-- Icon
                Text(
                  "Feedback",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            label: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              ),
              minimumSize: MaterialStateProperty.all(Size(150, 150)),
              textStyle: MaterialStateProperty.all(TextStyle(fontSize: 18)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 181, 236, 205),
              ),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
