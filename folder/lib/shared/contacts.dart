import 'package:flutter/material.dart';
import 'package:paypal/utils/constants.dart';
import 'package:paypal/shared/contact_item.dart';

class Contacts extends StatelessWidget {

  final Widget navigateTo;

  Contacts({@required this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "Contacts",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(
          height: 16,
        ),

        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                
                ContactItem(
                  navigateTo: navigateTo,
                  imageUrl: "assets/images/awhad.jpg",
                  fullName: "Pranav Awhad",
                ),

                ContactItem(
                  navigateTo: navigateTo,
                  imageUrl: "assets/images/chary.jpg",
                  fullName: "Abhishek Chary",
                ),

                ContactItem(
                  navigateTo: navigateTo,
                  imageUrl: "assets/images/dubey.jpg",
                  fullName: "Aryan Dubey",
                ),

                ContactItem(
                  navigateTo: navigateTo,
                  imageUrl: "assets/images/mehta.jpg",
                  fullName: "Aaryan Mehta",
                ),

                ContactItem(
                  navigateTo: navigateTo,
                  imageUrl: "assets/images/padawe.jpg",
                  fullName: "Pranav Padawe",
                ),

                ContactItem(
                  navigateTo: navigateTo,
                  imageUrl: "assets/images/tejas.jpg",
                  fullName: "Tejas Hasabnis",
                ),

                ContactItem(
                  navigateTo: navigateTo,
                  imageUrl: "assets/images/venky.jpg",
                  fullName: "Venkatesh Rallapali",
                ),

                // ContactItem(
                //   navigateTo: navigateTo,
                //   imageUrl: "assets/images/user_7.jpg",
                //   fullName: "Ross Geller",
                // ),

                // ContactItem(
                //   navigateTo: navigateTo,
                //   imageUrl: "assets/images/user_8.jpg",
                //   fullName: "Chandler Bing",
                // ),

                // ContactItem(
                //   navigateTo: navigateTo,
                //   imageUrl: "assets/images/user_9.jpg",
                //   fullName: "Yoyi Delirio",
                // ),

              ],
            ),
          ),
        ),

      ],
    );
  }
}