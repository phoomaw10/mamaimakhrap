import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mamaimakhrap/firebase_options.dart';
import 'package:mamaimakhrap/model/authen.dart';

class AuthService {
  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
            scopes: <String>["email"],
            clientId: DefaultFirebaseOptions.currentPlatform.iosClientId)
        .signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    final idToken = await userCredential.user!.getIdToken();

    final dio = Dio();
    final response =
        await dio.get('http://10.5.4.128:8080/callback?idToken=' + idToken);

    CallbackResponse cb = CallbackResponse.fromJson(response.data);

    print(cb.token);

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
