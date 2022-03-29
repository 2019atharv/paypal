import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  // creating firebaseauth object -> instance of FirebaseAuth class
  final FirebaseAuth _auth = FirebaseAuth.instance;


  // signin anonymously
  Future signinAnon() async{

    try {
      UserCredential result =await _auth.signInAnonymously();

    } catch(e){


    }

  }

  // sigin with email/password


  // register with email/password


  // signout

}