import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthException implements Exception {
  final String msg;

  AuthException(this.msg);
}

class Auth {
  Future<bool> login(String email, String password) async {
    await Firebase.initializeApp();
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        return true;
      } else {
        return false;
      }
    } on FirebaseAuthException catch (e) {
      String msgError;

      if (e.code == "user-not-found") {
        msgError = "Email o contraseña incorrectos";
      } else if (e.code == "wrong-password") {
        msgError = "Email o contraseña incorrectos";
      }
      throw AuthException(msgError);
    }
  }
}
