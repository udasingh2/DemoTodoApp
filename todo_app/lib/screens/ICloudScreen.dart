import 'package:flutter/material.dart';

class ICloudScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
      onTap: () => print('Tapped'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            //Use of SizedBox
            height: 50,
          ),
          Container(
              width: 200,
              height: 100,
              child: Image.asset('assets/images/cloud.png')),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "Use",
              style: TextStyle(color: Colors.black, fontSize: 30),
              children: <TextSpan>[
                TextSpan(
                    text: ' iCloud?',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30)),
                TextSpan(
                    text: '\n\nStoring your list in icloud allows',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 20)),
                TextSpan(
                    text: '\nyou to keep your data in sync',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 20)),
                TextSpan(
                    text: '\nacross your iPhone, iPad or Mac.',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 20)),
              ],
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
                  onPressed: () {},
                  textColor: Colors.black,
                  child: Text("Not Now", style: TextStyle(fontSize: 15)),
                ),
              ),
              SizedBox(width: 50),
              new SizedBox(
                width: 120.0,
                height: 45.0,
                child: FlatButton(
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.black)),
                  onPressed: () {},
                  textColor: Colors.black,
                  child: Text("Use iCloud",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
