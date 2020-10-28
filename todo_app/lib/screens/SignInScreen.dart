import 'package:flutter/material.dart';
import 'package:todoapp/screens/PersonalList.dart';
import 'package:todoapp/screens/SignInScreen.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
            child: GestureDetector(
      onTap: () => print('Tapped'),
      child: Column(
        children: <Widget>[
          SizedBox(
            //Use of SizedBox
            height: 150,
          ),
          Text(
              'Sign Up to the newsletter, and\n unlock a theme for your lists. ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.normal)),
          SizedBox(
            //Use of SizedBox
            height: 50,
          ),
          Container(
              width: 250,
              height: 150,
              child: Image.asset('assets/images/mail.png', fit: BoxFit.fill)),
          SizedBox(
            //Use of SizedBox
            height: 50,
          ),
          Container(
            width: 285.0,
            height: 45.0,
            child: TextField(
              key: Key('email'),
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                hintText: 'Email Address',
              ),
            ),
          ),
          SizedBox(
            //Use of SizedBox
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new SizedBox(
                width: 120.0,
                height: 45.0,
                child: FlatButton(
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.black)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PersonalList()),
                    );
                  },
                  textColor: Colors.black,
                  child: Text("Skip", style: TextStyle(fontSize: 15)),
                ),
              ),
              SizedBox(width: 50),
              new SizedBox(
                width: 120.0,
                height: 45.0,
                child: FlatButton(
                  key:Key('Join'),
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.black)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PersonalList()),
                    );
                  },
                  textColor: Colors.black,
                  child: Text("Join",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          )
        ],
      ),
    )));
  }
}
