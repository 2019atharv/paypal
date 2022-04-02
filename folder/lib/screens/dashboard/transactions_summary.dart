import 'package:flutter/material.dart';
import 'package:paypal/utils/constants.dart';
import 'package:paypal/screens/dashboard/transactions.dart';
import 'package:paypal/screens/dashboard/transaction_item.dart';
import 'package:intl/intl.dart';


class TransactionsSummary extends StatelessWidget {
  @override

  String cdate = DateFormat("MMMM, dd, yyyy").format(DateTime.now());
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                "Transactions",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Transactions()),
                  );
                },
                child: Icon(
                  Icons.arrow_forward,
                  color: kPrimaryColor,
                ),
              ),

            ],
          ),

          SizedBox(
            height: 16,
          ),

          Text(
            cdate,
            style: TextStyle(
              color: kGreyColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(
            height: 8,
          ),

          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  
                  TransactionItem(
                    imageUrl: "assets/images/awhad.jpg",
                    fullName: "Pranav Awhad",
                    status: "received",
                    amount: "57.01",
                  ),

                  TransactionItem(
                    imageUrl: "assets/images/chary.jpg",
                    fullName: "Abhishek Chary",
                    status: "sent",
                    amount: "19.63",
                  ),

                  TransactionItem(
                    imageUrl: "assets/images/dubey.jpg",
                    fullName: "Aryan Dubey",
                    status: "received",
                    amount: "114.00",
                  ),

                  TransactionItem(
                    imageUrl: "assets/images/mehta.jpg",
                    fullName: "Aaryan Mehta",
                    status: "received",
                    amount: "70.16",
                  ),

                  TransactionItem(
                    imageUrl: "assets/images/padawe.jpg",
                    fullName: "Pranav Padawe",
                    status: "sent",
                    amount: "44.50",
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}