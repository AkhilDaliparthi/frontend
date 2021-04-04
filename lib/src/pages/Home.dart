import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constant.dart';
import 'package:frontend/src/components/AppBar.dart';
import 'package:frontend/src/components/SlideAnimatedText.dart';

class Home extends StatefulWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(child: Home()),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // This size provide us total height and width  of our screen
    return Scaffold(
        body: AnimateIfVisibleWrapper(
            showItemInterval: Duration(milliseconds: 50),
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomAppBar(),
                      Container(
                        width: screenWidth,
                        height: screenHeight,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              alignment: Alignment.center,
                              image: AssetImage("assets/images/logo.png"),
                              fit: BoxFit.fitHeight),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.1),
                      Center(
                          child: getSlideAnimatedText("comp_service_str",
                              SERVICES_STR, 40, true, true, -2, 0, 10, 0, 10)),
                      Center(
                          child: getSlideAnimatedText(
                              "comp_service_text",
                              SERVICES_TEXT,
                              15,
                              false,
                              false,
                              -0.25,
                              400,
                              10,
                              400,
                              10)),
                      SizedBox(height: screenHeight * 0.1),
                    ]))));
  }

  SlideAnimatedText getSlideAnimatedText(
      String key,
      String text,
      double fontSize,
      bool isAlignedCenter,
      bool isBold,
      double horizontalOffset,
      double leftPadding,
      double topPadding,
      double rightPadding,
      double bottomPadding) {
    return new SlideAnimatedText(
        widgetKey: key,
        text: text,
        fontSize: fontSize,
        isAlignedCenter: isAlignedCenter,
        isBold: isBold,
        horizontalOffset: horizontalOffset,
        leftPadding: leftPadding,
        topPadding: topPadding,
        rightPadding: rightPadding,
        bottomPadding: bottomPadding);
  }
}
