import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:mamaimakhrap/CoursePage.dart';
import 'package:mamaimakhrap/FeedbackPage.dart';
import 'package:mamaimakhrap/HistoryPage.dart';
import 'package:mamaimakhrap/QRCodePage.dart';
import 'package:mamaimakhrap/StudentHomePage.dart';
import 'package:mamaimakhrap/studentProfile.dart';

class mainpage extends StatefulWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  final pages = const [
    CoursePage(),
    HistoryPage(),
    QRCodePage(),
    studentProfile()
  ];
  int _selectedTab = 3;
  double screenHeight = 0;
  double screenWidth = 0;
  Color primary = Color.fromARGB(255, 2, 2, 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: ((index) {
          setState(() {
            this._selectedTab = index;
            // print(index);
          });
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
              color: Colors.black,
            ),
            label: 'Course',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              color: Colors.black,
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.qr_code,
              color: Colors.black,
            ),
            label: 'QR code',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_rounded,
              color: Colors.black,
            ),
            label: 'Person',
          ),
        ],
      ),
      body: pages[_selectedTab],
    );
  }
}
