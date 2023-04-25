import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:mamaimakhrap/CoursePage.dart';
import 'package:mamaimakhrap/FeedbackPage.dart';
import 'package:mamaimakhrap/HistoryPage.dart';
import 'package:mamaimakhrap/QRCodePage.dart';
import 'package:mamaimakhrap/ScanPage.dart';
import 'package:mamaimakhrap/StudentHomePage.dart';
import 'package:mamaimakhrap/TeacherCoursePage.dart';
import 'package:mamaimakhrap/TeacherProfile.dart';
import 'package:mamaimakhrap/studentProfile.dart';

class NavbarTeacher extends StatefulWidget {
  const NavbarTeacher({super.key});

  @override
  State<NavbarTeacher> createState() => _NavbarTeacherState();
}

class _NavbarTeacherState extends State<NavbarTeacher> {
  final pages = const [TeacherCoursePage(), ScanPage(), TeacherProfile()];
  int _selectedTab = 2;
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
            backgroundColor: Color.fromARGB(255, 236, 242, 255),
            icon: Icon(
              Icons.book,
              color: Color.fromARGB(255, 56, 56, 154),
            ),
            label: 'Course',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 236, 242, 255),
            icon: Icon(
              Icons.qr_code_scanner_rounded,
              color: Color.fromARGB(255, 56, 56, 154),
            ),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 236, 242, 255),
            icon: Icon(
              Icons.person_2_rounded,
              color: Color.fromARGB(255, 56, 56, 154),
            ),
            label: 'Porfile',
          ),
        ],
        selectedItemColor: Color.fromARGB(255, 56, 56, 154),
      ),
      body: pages[_selectedTab],
    );
  }
}
