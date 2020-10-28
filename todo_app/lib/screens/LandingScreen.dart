import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:todoapp/screens/WelcomeScreen.dart';
import 'package:todoapp/screens/TextImageScreen.dart';
import 'package:todoapp/screens/ICloudScreen.dart';
import 'package:todoapp/screens/SignInScreen.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  LandingScreenState createState() => LandingScreenState();
}

class LandingScreenState extends State<LandingScreen> with TickerProviderStateMixin {

  Animation<double> animation;
  AnimationController animationController;
  int _currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );
  final _currentPageNotifier = ValueNotifier<int>(0);
  final _boxHeight = 150.0;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    animation = Tween<double>(begin: 70, end: -280).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
      body: Center(
          child: Stack(
        children: <Widget>[
          _pagebuilder(),
          _buildCircleIndicator(),
        ],
      )),
    );
  }

  _pagebuilder() {
    return PageView.builder(
      itemBuilder: (context, position) {
        if (position == 0) {
          animationController.reverse();
        }else if (position == 1) {
          animationController.forward();
        } else if (position == 6) {
          animationController.reverse();
        }
        return _buildPage(position);
      },
      itemCount: 8,
      onPageChanged: (int index) {
        _currentPageNotifier.value = index;
      }, // Can be null
    );
  }

  _buildPage(int position) {
    switch (position) {
      case 0:
        return WelcomeScreen();
        break;
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
        return TextImageScreen(position: position);
        break;
      case 6:
        return ICloudScreen();
        break;
      case 7:
        return SignInScreen();
        break;
      default:
        {
          return Container(
            color: position % 2 == 0 ? Colors.pink : Colors.cyan,
          );
        }
        break;
    }
  }

  _buildCircleIndicator() {
    return Align(
      alignment: AlignmentDirectional(0, 0.7),
      child: Transform.translate(
        offset: Offset(0, animation.value),
        child: Positioned(
          left: 0.0,
          right: 0.0,
          bottom: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CirclePageIndicator(
              dotColor: Colors.grey,
              selectedDotColor: Colors.black,
              itemCount: 8,
              currentPageNotifier: _currentPageNotifier,
            ),
          ),
        ),
      ),
    );
  }
}
