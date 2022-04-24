import 'package:flutter/material.dart';
import 'package:paypal/screens/login.dart';
import 'package:paypal/screens/master.dart';
import 'package:paypal/utils/constants.dart';
import 'package:paypal/shared/custom_field.dart';
import 'package:paypal/shared/rounded_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:paypal/services/auth.dart';



class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formkey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  var _fullname;
  var _signupEmail;
  var _mobileNumber;
  var _signupPassword;
  var _confirmPassword;
  String error='';
  
  @override
  final _emailController = TextEditingController();
  bool _isValid = false;

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
                    Text(
                      "Sign Up",
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
                      key: _formkey,
                      child: Column(children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Full Name",
                            icon: Icon(Icons.person, color: kPrimaryColor),
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
                          onChanged: (value) {
                            setState(() => _fullname = value);
                            //_fullname = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Full Name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
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
                          onChanged: (value) {
                            setState(() => _signupEmail = value);
                            //_signupEmail = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          decoration: InputDecoration(
                            labelText: "Mobile No.",
                            icon: Icon(Icons.phone, color: kPrimaryColor),
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
                          onChanged: (value) {
                            setState(() => _mobileNumber = value);
                            //_mobileNumber = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Mobile Number';
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
                          onChanged: (value) {
                            setState(() => _signupPassword = value);
                            //_signupPassword = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Password';
                            }else if (value.length < 6){
                              return 'Password is too short';
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
                            labelText: "Confirm Password",
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
                          onChanged: (value) {
                            setState(() => _confirmPassword = value);
                            //_confirmPassword = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Confirm Password!';
                            }
                            if (_signupPassword != _confirmPassword) {
                              return "Password doesn't match";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ]),
                    ),

                    // CustomField(
                    //   hintText: "Email",
                    //   iconData: Icons.alternate_email,
                    // ),

                    // CustomField(
                    //   hintText: "Mobile number",
                    //   iconData: Icons.phone,
                    // ),

                    // CustomField(
                    //   hintText: "Create your password",
                    //   iconData: Icons.lock_outline,
                    // ),

                    // CustomField(
                    //   hintText: "Confirm your password",
                    //   iconData: Icons.lock_outline,
                    // ),

                    SizedBox(
                      height: 32,
                    ),

                    RoundedButton(
                      text: "Sign Up",
                      onPress: () async{
                        
                        _isValid = EmailValidator.validate(_emailController.text);
                        if (_isValid){
                            if (_formkey.currentState.validate()) {
                          _formkey.currentState.save();
                          dynamic result = await _auth.registerEmail(_signupEmail, _signupPassword);
                          if (result == null){
                            setState(() => error = 'Please check your details again');

                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        }
                        } 
                        
                      },
                    ),

                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      error,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "By signing up, you agreed with our term of Services and Privacy Policy.",
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
                          "Already have an account?",
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
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: Text(
                            "Log In",
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
