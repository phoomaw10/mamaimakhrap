import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:mamaimakhrap/profile.dart';

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
  String? errorText = null;
  Color primary = Color.fromARGB(255, 255, 255, 255);
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: '', password: '');

  void refreshErrorText() {
    final text = idController.value.text;
    if (!text.endsWith("@kmutt.ac.th")) {
      setState(() {
        errorText = 'An email must be @kmutt.ac.th';
      });
    } else {
      setState(() {
        errorText = null;
      });
    }
  }

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
                  GestureDetector(
                      onTap: () async {
                        try {
                          print(11111);
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: idController.text,
                                  password: passController.text);
                          print(22222);
                        } on FirebaseAuthException catch (e) {
                          print(333333);
                          if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                          }
                        }
                      },
                      child: Container(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth / 15,
                            color: Color.fromARGB(255, 56, 56, 154),
                          ),
                        ),
                      )),
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
                        customFieldEmail("Username", idController, false,
                            errorText, refreshErrorText),
                        customFieldPassword("Password", passController, true),
                        SizedBox(
                          height: 130,
                          width: double.infinity,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: idController.text.trim(),
                                        password: passController.text.trim());
                                // formKey.currentState!.save();
                                print(
                                    "email = ${idController.text} password= ${passController.text}");
                              },
                              child: Text('Login'),
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(350, 50),
                                textStyle: const TextStyle(fontSize: 25),
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    Color.fromARGB(255, 56, 56, 154),
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
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  Widget customFieldEmail(String hint, TextEditingController controller,
      bool obscure, String? _errorText, Function refreshErrorText) {
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
                onChanged: (value) {
                  refreshErrorText();
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: screenHeight / 40,
                    ),
                    hintText: hint,
                    border: InputBorder.none,
                    errorText: _errorText),
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
