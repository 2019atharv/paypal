import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/onboarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:paypal/services/auth.dart';
import 'package:paypal/models/CustomUser.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //initializing the app in firebase
  // DefaultFirebaseOptions.currentPlatform is auto-generated file
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser>.value(
      
      value: AuthService().user,
      child: MaterialApp(
        title: 'Paypal MAD Project',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.montserratTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        home: Onboarding(),
      ),
    );
  }
}

