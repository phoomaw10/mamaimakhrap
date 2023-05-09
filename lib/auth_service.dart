import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mamaimakhrap/caller.dart';
import 'package:mamaimakhrap/firebase_options.dart';
import 'package:mamaimakhrap/loginscreen.dart';
import 'package:mamaimakhrap/model/authen.dart';
import 'package:mamaimakhrap/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' show Platform;

class AuthService {
  signInWithGoogle() async {
    print(1);
    String os = Platform.operatingSystem;
    GoogleSignInAccount? googleUser;
    if (Platform.isAndroid) {
     googleUser = await GoogleSignIn(
            
            )
        .signIn();
    }
    if (Platform.isIOS){
      googleUser = await GoogleSignIn(
            scopes: <String>["email"],
            clientId: DefaultFirebaseOptions.currentPlatform.iosClientId)
        .signIn();
    }
    print(2);
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    print(3);
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    print(4);
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print(5);
    final idToken = await userCredential.user!.getIdToken();
    print(6);
    final dio = Dio();
    print(7);
    final response = await Caller.dio.get('/callback?idToken=' + idToken);
    print(8);
    CallbackResponse cb = CallbackResponse.fromJson(response.data);

    print(cb.token);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', cb.token);
    Caller.setToken(cb.token);
  }

  signOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    FirebaseAuth.instance.signOut();
    await prefs.remove('token');
  }

  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return SplashScreen();
          } else {
            return const LoginScreen();
          }
        });
  }
}
