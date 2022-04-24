import 'package:flutter/material.dart';
import 'package:paypal/screens/dashboard/dashboard.dart';
import 'package:paypal/screens/onboarding.dart';
import 'package:provider/provider.dart';
import 'package:paypal/screens/login.dart';
import 'package:paypal/models/CustomUser.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);
    if (user == null) {
      return Login();
    } else {
      return Dashboard();
    }
    //return Onboarding();
  }
}
