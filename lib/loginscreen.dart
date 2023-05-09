import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mamaimakhrap/auth_service.dart';
import 'package:mamaimakhrap/profile.dart';
import 'package:mamaimakhrap/splash_screen.dart';

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
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: '', password: '');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            screenHeight = MediaQuery.of(context).size.height;
            screenWidth = MediaQuery.of(context).size.width;
            return Scaffold(
              backgroundColor: primary,
              resizeToAvoidBottomInset: false,
              body: Column(
                children: [
                  Image.asset('images/MaMai.png'),
                  Container(
                      child: Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth / 15,
                      color: Color.fromARGB(255, 56, 56, 154),
                    ),
                  )),
                  Container(
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
                        SizedBox(
                          height: 100,
                          width: double.infinity,
                          child: Center(
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 5, 47, 109),
                                minimumSize: Size(double.infinity, 50),
                              ),
                              icon: FaIcon(FontAwesomeIcons.google,
                                  color: Colors.orange),
                              label: Text("Login with Google"),
                              onPressed: () async {
                                await AuthService().signInWithGoogle();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SplashScreen()));
                                // formKey.currentState!.save();
                                print(
                                    "email = ${idController.text} password= ${passController.text}");
                              },
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
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  Widget customFieldEmail(
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
                onSaved: (String? email) {
                  profile.email = email!;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customFieldPassword(
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
                onSaved: (String? password) {
                  profile.password = password!;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///////////////////////////////////////////////// 

