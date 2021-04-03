import 'package:flutter/material.dart';
import 'package:frontend/src/components/DefaultButton.dart';
import 'package:frontend/src/components/MenuItems.dart';
import 'package:frontend/src/routes.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(46),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 30,
            color: Colors.black.withOpacity(0.16),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 5),
          Text(
            "Bear & Bull Investments".toUpperCase(),
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          MenuItem(
            title: "About",
            press: () {
              Navigator.pushNamed(context, aboutRoute);
            },
          ),
          MenuItem(
            title: "Services",
            press: () {},
          ),
          MenuItem(
            title: "Contact Us",
            press: () {},
          ),
          MenuItem(
            title: "Careers",
            press: () {},
          ),
          MenuItem(
            title: "Investor Education",
            press: () {},
          ),
          MenuItem(
            title: "Book Online",
            press: () {},
          ),
          DefaultButton(
            text: "Login",
            press: () {},
          ),
        ],
      ),
    );
  }
}