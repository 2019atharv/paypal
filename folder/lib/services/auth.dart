import 'package:firebase_auth/firebase_auth.dart';
import 'package:paypal/models/CustomUser.dart';
import 'package:paypal/screens/login.dart';

class AuthService {
  // creating firebaseauth object -> instance of FirebaseAuth class
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser

  CustomUser _userFromFirebaseUser(User user) {
    return user != null ? CustomUser(uid: user.uid) : null;
  }

  //auth change user stream from
  Stream<CustomUser> get user {
    return _auth
        .authStateChanges()
        .map((User user) => _userFromFirebaseUser(user));
  }

  // signin anonymously
  Future signinAnon() async {
    try {
      //AuthResult changed to UserCredential
      UserCredential result = await _auth.signInAnonymously();

      //FirebaseUser changed to User
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sigin with email/password
  Future signinEmail(String email, String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }



  // register with email/password
  Future registerEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // signout
  Future signOut() async {
    try {
      // return Login();
      
      return await _auth.signOut();
      
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
