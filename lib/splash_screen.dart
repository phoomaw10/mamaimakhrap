import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:mamaimakhrap/NavbarStudent.dart';
import 'package:mamaimakhrap/NavbarTeacher.dart';
import 'package:mamaimakhrap/caller.dart';
import 'package:mamaimakhrap/loginscreen.dart';
import 'package:mamaimakhrap/model/me.dart';
import 'package:mamaimakhrap/role.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future navigate() async {
    // Get user token from shared preferences
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? "";

    if (token == "") {
      return KeyboardVisibilityProvider(child: LoginScreen());
    }

    // Set caller token value
    Caller.setToken(token);

    print(111122);
    try {
      // * Call launch information endpoint
      final response = await Caller.dio.get("/me");
      // * Parse response
      print(response.data);
      final data = Profile.fromJson(response.data);
      if (data.role == "unset") {
        return const RolePage();
      } else if (data.role == "teacher") {
        return const NavbarTeacher();
      } else if (data.role == "student") {
        return const NavbarStudent();
      } else {
        exit(0);
      }
    } on DioError catch (e) {
      print(e.toString());
      exit(0);
    }
  }

  @override
  void initState() {
    super.initState();

    // Timer
    Timer(
      const Duration(milliseconds: 3000),
      () async {
        print(1111);
        final navi = await navigate();
        print(2222);
        if (mounted) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      navi)); // Use pushReplacement for clear backstack.
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: .6,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/bgapp.png'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
