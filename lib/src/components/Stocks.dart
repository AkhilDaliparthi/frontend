import 'package:flutter/material.dart';
import 'package:frontend/globals.dart';

class Stocks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: StocksPage(),
          ),
        ),
      ),
    );
  }
}

class StocksPage extends StatefulWidget {
  @override
  StocksPageState createState() => StocksPageState();
}

class StocksPageState extends State<StocksPage> {

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Welcome to Stocks ' + user.firstName,
                style: Theme.of(context).textTheme.headline4),
          ],
        ));
  }
}
