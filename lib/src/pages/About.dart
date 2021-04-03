import 'package:flutter/material.dart';
import 'package:frontend/src/components/AppBar.dart';

import '../../constant.dart';

class About extends StatefulWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 400,
          child: About(),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return new AboutState();
  }
}

class AboutState extends State<About> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomAppBar(),
            SizedBox(height: screenHeight * 0.1),
            Center(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text(ABOUT_STR,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        )))),
            Center(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(400, 10, 400, 10),
                    child: Text(ABOUT_TEXT,
                        textAlign: TextAlign.justify,
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        )))),
            SizedBox(height: screenHeight * 0.1),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    buildBoldTextContainer(screenWidth,
                        VISION_MISSION_VALUES_STR, 100, 10, 20, 10),
                    buildTextContainer(screenWidth, VISION_MISSION_VALUES_TEXT,
                        100, 10, 20, 10)
                  ],
                ),
                Spacer(),
                Column(
                  children: <Widget>[
                    buildBoldTextContainer(
                        screenWidth, PHILOSOPHY_STR, 20, 10, 100, 10),
                    buildTextContainer(
                        screenWidth, PHILOSOPHY_TEXT, 20, 10, 100, 10)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container buildTextContainer(
      double screenWidth,
      String txt,
      double leftPadding,
      double topPadding,
      double rightPadding,
      double bottomPadding) {
    return new Container(
        width: screenWidth * 0.4,
        padding: EdgeInsets.fromLTRB(
            leftPadding, topPadding, rightPadding, bottomPadding),
        alignment: Alignment.center,
        child: Text(txt,
            textAlign: TextAlign.justify,
            softWrap: true,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            )));
  }

  Container buildBoldTextContainer(
      double screenWidth,
      String txt,
      double leftPadding,
      double topPadding,
      double rightPadding,
      double bottomPadding) {
    return new Container(
        width: screenWidth * 0.4,
        padding: EdgeInsets.fromLTRB(
            leftPadding, topPadding, rightPadding, bottomPadding),
        alignment: Alignment.center,
        child: Text(txt,
            textAlign: TextAlign.justify,
            softWrap: true,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 35,
            )));
  }
}
