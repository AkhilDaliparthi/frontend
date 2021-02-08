import 'package:flutter/material.dart';
import 'package:frontend/src/components/Home.dart';
import 'package:frontend/src/components/SignIn.dart';
import 'package:frontend/src/components/SignUp.dart';
import 'package:frontend/src/components/Stocks.dart';

void main() => runApp(Frontend());

class Frontend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home(),
        '/signIn':(context) => SignIn(),
        '/signUp' : (context) => SignUp(),
        '/home' : (context) => Home(),
        '/stocks' : (context) => Stocks()
      },
    );
  }
}
