import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:frontend/src/components/AppBar.dart';
import 'package:frontend/src/components/SlideAnimatedText.dart';

import '../../constant.dart';

class About extends StatefulWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200], body: Center(child: About()));
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
        body: AnimateIfVisibleWrapper(
            showItemInterval: Duration(milliseconds: 50),
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomAppBar(),
                      SizedBox(height: screenHeight * 0.1),
                      Center(
                          child: getSlideAnimatedText("comp_about_str",
                              ABOUT_STR, 40, true, true, -2, 0, 10, 0, 10)),
                      Center(
                          child: getSlideAnimatedText(
                              "comp_about_text",
                              ABOUT_TEXT,
                              15,
                              false,
                              false,
                              -0.25,
                              400,
                              10,
                              400,
                              10)),
                      SizedBox(height: screenHeight * 0.1),
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                width: screenWidth * 0.4,
                                child: getSlideAnimatedText(
                                    "comp_vision_str",
                                    VISION_MISSION_VALUES_STR,
                                    35,
                                    true,
                                    true,
                                    -1,
                                    100,
                                    10,
                                    0,
                                    10),
                              ),
                              Container(
                                  width: screenWidth * 0.4,
                                  child: getSlideAnimatedText(
                                      "comp_vision_text",
                                      VISION_MISSION_VALUES_TEXT,
                                      15,
                                      false,
                                      false,
                                      -0.25,
                                      100,
                                      10,
                                      0,
                                      10))
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: <Widget>[
                              Container(
                                  width: screenWidth * 0.4,
                                  child: getSlideAnimatedText(
                                      "comp_philosophy_str",
                                      PHILOSOPHY_STR,
                                      35,
                                      true,
                                      true,
                                      -1,
                                      0,
                                      10,
                                      100,
                                      10)),
                              Container(
                                  width: screenWidth * 0.4,
                                  child: getSlideAnimatedText(
                                      "comp_philosophy_text",
                                      PHILOSOPHY_TEXT,
                                      15,
                                      false,
                                      false,
                                      -0.25,
                                      0,
                                      10,
                                      100,
                                      10))
                            ],
                          )
                        ],
                      ),
                      Row(children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                                width: screenWidth * 0.4,
                                child: getSlideAnimatedText(
                                    "comp_expertise_str",
                                    EXPERTISE_STR,
                                    35,
                                    true,
                                    true,
                                    -1,
                                    100,
                                    10,
                                    0,
                                    10)),
                            Container(
                                width: screenWidth * 0.4,
                                child: getSlideAnimatedText(
                                    "comp_expertise_text",
                                    EXPERTISE_TEXT,
                                    15,
                                    false,
                                    false,
                                    -0.25,
                                    100,
                                    10,
                                    0,
                                    10))
                          ],
                        ),
                        Spacer(),
                        Column(children: <Widget>[
                          Container(
                              width: screenWidth * 0.4,
                              child: getSlideAnimatedText(
                                  "comp_experience_str",
                                  EXPERIENCE_STR,
                                  35,
                                  true,
                                  true,
                                  -1,
                                  0,
                                  10,
                                  100,
                                  10)),
                          Container(
                              width: screenWidth * 0.4,
                              child: getSlideAnimatedText(
                                  "comp_experience_text",
                                  EXPERIENCE_TEXT,
                                  15,
                                  false,
                                  false,
                                  -0.25,
                                  0,
                                  10,
                                  100,
                                  10))
                        ])
                      ])
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
