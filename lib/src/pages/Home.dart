import 'package:flutter/material.dart';
import 'package:frontend/constant.dart';
import 'package:frontend/src/components/AppBar.dart';

class Home extends StatefulWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Home(),
      ),
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
    final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    final Animation<Offset> _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.5, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticIn,
    ));

    @override
    void dispose() {
      super.dispose();
      _controller.dispose();
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // This size provide us total height and width  of our screen
    return Scaffold(
      body: SingleChildScrollView(
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
                child: SlideTransition(
                    position: _offsetAnimation,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text(SERVICES_STR,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ))))),
            Center(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(400, 10, 400, 10),
                    child: Text(SERVICES_TEXT,
                        textAlign: TextAlign.justify,
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        )))),
            SizedBox(height: screenHeight * 0.1),
          ],
        ),
      ),
    );
  }
}
