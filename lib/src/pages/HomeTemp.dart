import 'dart:html';

import 'package:flutter/material.dart';
import 'package:frontend/constant.dart';
import 'package:frontend/src/api/UserApis.dart';
import 'package:frontend/src/pages/SignIn.dart';
import 'package:frontend/src/model/UserInfo.dart';

class HomeTemp extends StatefulWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: HomeTemp(),
          ),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return new HomeTempState();
  }
}

class HomeTempState extends State<HomeTemp> {

  @override
  Widget build(BuildContext context) {
    print("User Token : ${user.token}");
    if (user.token != null) {
      return Form(
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Hello ' + user.firstName,
                style: Theme.of(context).textTheme.headline4),
            new RaisedButton(
              child: new Text("Stocks"),
              onPressed: () {
              }
            ),
          ],
      ));
    } else {
      String token = window.localStorage['access_token'];
      print("Stored Token : $token");
      if (token != null) {
        Future<UserInfo> validUser = validateToken(token);
        validUser.then((userInfo) {
          if (userInfo.token == token) {
            user = userInfo;
            print("Routing to Home Page");
            return new HomeTemp();
          } else {
            print("Routing to SignIn Page");
            return new SignIn();
          }
        });
      } else {
        print("Routing to SignIn Page");
        return new SignIn();
      }
    }
  }
}
