import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // signin anon
  Future < FirebaseUser > signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    }
    catch(e) {
      print('sign in failed \n ${e.toString}');
      return null;
    }
  }

  // TODO sing in email & password

  // TODO sign up email & password

  // TODO signout
}
