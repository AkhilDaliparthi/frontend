import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

class SlideAnimatedText extends StatelessWidget {
  final String widgetKey;
  final String text;
  final double fontSize;
  final bool isAlignedCenter;
  final bool isBold;
  final double horizontalOffset;
  final double leftPadding;
  final double topPadding;
  final double rightPadding;
  final double bottomPadding;

  SlideAnimatedText(
      {this.widgetKey,
      this.text,
      this.fontSize,
      this.isAlignedCenter,
      this.isBold,
      this.horizontalOffset,
      this.leftPadding,
      this.topPadding,
      this.rightPadding,
      this.bottomPadding})
      : super(key: ObjectKey(widgetKey));

  @override
  AnimateIfVisible build(BuildContext context) {
    return AnimateIfVisible(
        key: Key(widgetKey),
        duration: Duration(milliseconds: 500),
        builder: (
          BuildContext context,
          Animation<double> animation,
        ) =>
            SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(horizontalOffset, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        leftPadding, topPadding, rightPadding, bottomPadding),
                    child: Text(text,
                        textAlign: isAlignedCenter
                            ? TextAlign.center
                            : TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight:
                              isBold ? FontWeight.bold : FontWeight.normal,
                          fontSize: fontSize,
                        )))));
  }
}
