import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:mamaimakhrap/ConfirmQR.dart';
import 'package:mamaimakhrap/CoursePage.dart';
import 'package:mamaimakhrap/FeedbackPage.dart';
import 'package:mamaimakhrap/HistoryPage.dart';
import 'package:mamaimakhrap/InsideCoursePage.dart';
import 'package:mamaimakhrap/InsideFeedbackPage.dart';
import 'package:mamaimakhrap/NavbarTeacher.dart';
import 'package:mamaimakhrap/QRCodePage.dart';
import 'package:mamaimakhrap/ScanPage.dart';
import 'package:mamaimakhrap/StudentHomePage.dart';
import 'package:mamaimakhrap/TeacherHomePage.dart';
import 'package:mamaimakhrap/TeacherProfile.dart';
import 'package:mamaimakhrap/caller.dart';
import 'package:mamaimakhrap/loginscreen.dart';
import 'package:mamaimakhrap/model/authen.dart';
import 'package:mamaimakhrap/model/me.dart';

import 'package:mamaimakhrap/role.dart';
import 'package:mamaimakhrap/splash_screen.dart';
import 'package:mamaimakhrap/studentProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'NavbarStudent.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

//build endpoint to check token
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen());
  }
}
