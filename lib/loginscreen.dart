import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController passController = TextEditingController();
  double screenHeight = 0;
  double screenWidth = 0;
  Color primary = const Color(0xffeef444c);

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible =
        KeyboardVisibilityProvider.isKeyboardVisible(context);
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          isKeyboardVisible
              ? const SizedBox()
              : Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/KMUTT.png'),
                          fit: BoxFit.fill)),
                ),
          Container(
            margin: EdgeInsets.only(
              top: screenHeight / 15,
            ),
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: screenWidth / 30,
                color: Colors.orange,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: screenHeight / 30,
            ),
            child: Text(
              "Sign in to your account.",
              style: TextStyle(
                fontSize: screenWidth / 50,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(
              horizontal: screenWidth / 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customField("Username", idController, false),
                customField("Password", passController, true),
                Container(
                  height: 60,
                  width: screenWidth,
                  decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        fontSize: screenWidth / 26,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget customField(
      String hint, TextEditingController controller, bool obscure) {
    return Container(
      width: screenWidth,
      margin: const EdgeInsets.only(bottom: 40),
      decoration: const BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          Container(
            width: screenWidth / 6,
            child: Icon(
              Icons.person,
              size: screenWidth / 15,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: screenWidth / 12),
              child: TextFormField(
                controller: controller,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: screenHeight / 35,
                    ),
                    hintText: hint,
                    border: InputBorder.none),
                maxLines: 1,
                obscureText: obscure,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
