import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => print('Tapped'),
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: "Welcome to ",
                style: TextStyle(color: Colors.black, fontSize: 30),
                children: <TextSpan>[
                  TextSpan(text: 'Clear', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(   //Use of SizedBox
              height: 30,
            ),
            RichText(
              text: TextSpan(
                text: "Tap or swipe ",
                style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(text: 'to begin', style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal)),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}