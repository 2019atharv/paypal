import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // creating firebaseauth object -> instance of FirebaseAuth class
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  // signin anonymously
  Future signinAnon() async {
    try {
      //AuthResult changed to UserCredential
      UserCredential result = await _auth.signInAnonymously();

      //FirebaseUser changed to User
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sigin with email/password

  // register with email/password

  // signout

}
