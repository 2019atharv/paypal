import 'package:flutter/material.dart';
import 'package:paypal/utils/constants.dart';
import 'package:paypal/shared/widgets.dart';
import 'package:paypal/screens/settings/setting_item.dart';
import 'package:paypal/services/auth.dart';
import 'package:paypal/screens/login.dart';

class Settings extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar("Settings"),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 16,
                ),
                Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/atharv.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Center(
                  child: Text(
                    "Atharv Uday Parab",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SettingItem(
                  title: "Contact Information",
                  iconData: Icons.person_pin,
                ),
                SettingItem(
                  title: "Change Password",
                  iconData: Icons.lock_open,
                ),
                SettingItem(
                  title: "Security",
                  iconData: Icons.security,
                ),
                SettingItem(
                  title: "Payment Privacy",
                  iconData: Icons.payment,
                ),
                SettingItem(
                  title: "Fees",
                  iconData: Icons.attach_money,
                ),
                SettingItem(
                  title: "Notifications",
                  iconData: Icons.notifications_none,
                ),
                SettingItem(
                  title: "Technical Support",
                  iconData: Icons.headset,
                ),
                SizedBox(
                  height: 15,
                ),
                TextButton.icon(
                  icon: Icon(Icons.logout_rounded),
                  label: Text('Logout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  style: TextButton.styleFrom(
                    primary: kPrimaryColor,
                    backgroundColor: kSecondaryColor,
                  ),
                  onPressed: () async {
                    await _auth.signOut();
            
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                    
                    //return Login();
                  },
                )
              ],
            ),
          ),
        ));
  }
}
