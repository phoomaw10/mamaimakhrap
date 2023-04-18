import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class TeacherHomePage extends StatefulWidget {
  const TeacherHomePage({Key? key}) : super(key: key);

  @override
  State<TeacherHomePage> createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  TextEditingController idController = TextEditingController();
  TextEditingController passController = TextEditingController();
  double screenHeight = 0;
  double screenWidth = 0;
  Color primary = Color.fromARGB(255, 255, 255, 255);
  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible =
        KeyboardVisibilityProvider.isKeyboardVisible(context);
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
                    "Vajirasak Vanija",
                    style: TextStyle(
                      fontSize: screenWidth / 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 56, 56, 154),
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
                    onPressed: () {},
                    icon: Column(
                      children: [
                        Icon(Icons.book, size: 50), // <-- Icon
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
                    onPressed: () {},
                    icon: Column(
                      children: [
                        Icon(Icons.qr_code_scanner, size: 50), // <-- Icon
                        Text(
                          "Scan",
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
          SizedBox(height: 40),
          ElevatedButton.icon(
            onPressed: () {},
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
