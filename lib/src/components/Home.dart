import 'dart:html';

import 'package:flutter/material.dart';
import 'package:frontend/globals.dart';
import 'package:frontend/src/api/UserApis.dart';
import 'package:frontend/src/components/SignIn.dart';
import 'package:frontend/src/components/Stocks.dart';
import 'package:frontend/src/model/UserInfo.dart';

class Home extends StatefulWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: Home(),
          ),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {

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
                Navigator.push(context, MaterialPageRoute(builder: (context) => Stocks()));
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
            return new Home();
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
