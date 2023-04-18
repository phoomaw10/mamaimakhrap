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
          Expanded(child: Image.asset('images/MaMai.png')),
          Container(
            child: Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth / 15,
                color: Color.fromARGB(255, 56, 56, 154),
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
                fontSize: screenWidth / 30,
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
                SizedBox(
                  height: 130,
                  width: double.infinity,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(350, 50),
                        textStyle: const TextStyle(fontSize: 25),
                        foregroundColor: Colors.white,
                        backgroundColor: Color.fromARGB(255, 56, 56, 154),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 130,
                  width: double.infinity,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Register'),
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                            width: 1.0,
                            color: Color.fromARGB(255, 56, 56, 154)),
                        fixedSize: const Size(350, 50),
                        textStyle: const TextStyle(fontSize: 25),
                        foregroundColor: Color.fromARGB(255, 56, 56, 154),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget customField(
    String hint,
    TextEditingController controller,
    bool obscure,
  ) {
    return Container(
      width: screenWidth,
      margin: const EdgeInsets.only(bottom: 40),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 236, 234, 234),
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
                      vertical: screenHeight / 40,
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
