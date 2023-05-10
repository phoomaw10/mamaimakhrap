import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mamaimakhrap/NavbarStudent.dart';
import 'package:mamaimakhrap/NavbarTeacher.dart';
import 'package:mamaimakhrap/caller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RolePage extends StatefulWidget {
  const RolePage({super.key});

  @override
  State<RolePage> createState() => _RolePageState();
}

class _RolePageState extends State<RolePage> {
  Future sendRole() async {
    // Set caller token value
    try {
      // * Call launch information endpoint
      final tokem = await Caller.dio.post("/me/role");
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', tokem as String);
    } on DioError catch (e) {
      print(e);
    }
  }

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
        body: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Container(
                child: Text(
              "Choose your role",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth / 15,
                color: Color.fromARGB(255, 56, 56, 154),
              ),
            )),
            SizedBox(
              height: screenHeight / 3,
              width: double.infinity,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Caller.dio.post("/me/role", data: {"role": "teacher"});
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NavbarTeacher()));
                  },
                  child: Image.asset('images/Teacher.png'),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 200),
                    textStyle: const TextStyle(fontSize: 25),
                    foregroundColor: Color.fromARGB(255, 56, 56, 154),
                    backgroundColor: Color.fromARGB(255, 56, 56, 154),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight / 3,
              width: double.infinity,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Caller.dio.post("/me/role", data: {"role": "student"});
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NavbarStudent()));
                  },
                  child: Image.asset('images/Student.png'),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 200),
                    textStyle: const TextStyle(fontSize: 25),
                    foregroundColor: Color.fromARGB(255, 56, 56, 154),
                    backgroundColor: Color.fromARGB(255, 236, 242, 255),
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}
