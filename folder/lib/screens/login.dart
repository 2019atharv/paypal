//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paypal/screens/master.dart';
import 'package:paypal/screens/signup.dart';
import 'package:paypal/utils/constants.dart';
import 'package:paypal/shared/custom_field.dart';
import 'package:paypal/shared/rounded_button.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  //final _auth = FirebaseAuth.instance;

  var _loginEmail;
  var _loginPasssword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Image.asset('assets/images/paypal_logo.png',
                          height: 75, width: 75),
                    ),
                    Text(
                      "Log In",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _formKey,
                      child: Column(children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Email Id",
                            icon: Icon(Icons.email, color: kPrimaryColor),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: kPrimaryColor,
                                width: 2,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: kPrimaryColor,
                                width: 2,
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: kPrimaryColor,
                                width: 2,
                              ),
                            ),
                          ),
                          onSaved: (value) {
                            _loginEmail = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            icon: Icon(Icons.lock, color: kPrimaryColor),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: kPrimaryColor,
                                width: 2,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: kPrimaryColor,
                                width: 2,
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: kPrimaryColor,
                                width: 2,
                              ),
                            ),
                          ),
                          onSaved: (value) {
                            _loginPasssword = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        RoundedButton(
                          text: "Log In",
                          onPress: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();

                              // Navigation
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Master()),
                              );
                            }
                          },
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Thank you for choosing Paypal.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kGreyColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Do you have an account?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Signup()),
                            );
                          },
                          child: Text(
                            "Sign Up",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// loginFunction
