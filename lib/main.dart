import 'package:flutter/material.dart';
import 'package:frontend/src/pages/About.dart';
import 'package:frontend/src/pages/Home.dart';
import 'package:frontend/src/pages/SignIn.dart';
import 'package:frontend/src/pages/SignUp.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(Frontend());
}

class Frontend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home(),
        '/signIn': (context) => SignIn(),
        '/signUp': (context) => SignUp(),
        '/home': (context) => Home(),
        '/about': (context) => About()
      },
    );
  }
}
