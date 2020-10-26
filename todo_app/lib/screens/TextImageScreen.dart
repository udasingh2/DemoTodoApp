import 'package:flutter/material.dart';
import 'dart:ui';

class TextImageScreen extends StatefulWidget {
  TextImageScreen({Key key, this.position}) : super(key: key);
  int position;
  @override
  TextImageScreenState createState() => TextImageScreenState();
}

class TextImageScreenState extends State<TextImageScreen>
    with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds:700));
    animation = Tween<double>(begin: 400, end: 0).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
           children: <Widget>[
           SizedBox(height: 170),
         _textWidget(widget.position),
          SizedBox(height: 100),
             customDynamicWidget(),
      ],
    ));
  }
  
  _textWidget(int postion) {
    if(postion == 1) {
      return _page2text();
    } else if(postion == 2) {
      return _page3text();
    }else if(postion == 3) {
      return _page4text();
    }else if(postion == 4) {
      return _page5text();
    }else if(postion == 5) {
      return _page6text();
    }
  }

  _page2text() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Clear sorts item by",
        style: TextStyle(color: Colors.black, fontSize: 25),
        children: <TextSpan>[
          TextSpan(
              text: ' Priorty',
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold)),
          TextSpan(
              text: '\n\nImportant items are heighlighted\nat the top...',
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.normal)),
        ],
      ),
    );
  }

  _page3text() {
    return  RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Tap and hold",
        style: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold),
        children: <TextSpan>[
          TextSpan(
              text: ' to pick an item up',
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.normal)),
          TextSpan(
              text: '\n\ndrag it up and down to change its\npriority',
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.normal)),
        ],
      ),
    );
  }

  _page4text() {
    return Text(
      'there are three navigations lavel...\n\n\n  ',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 25, color:Colors.black),
    );
  }

  _page5text() {
    return  RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Pinch together vertically",
        style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        children: <TextSpan>[
          TextSpan(
              text: ' to',
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.normal)),
          TextSpan(
              text: 'Collapse your current level and \nnavigate up.',
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.normal)),
        ],
      ),
    );
  }

  _page6text() {
    return  RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Tap on a list",
        style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        children: <TextSpan>[
          TextSpan(
              text: ' to see its content',
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.normal)),
          TextSpan(
              text: '\nTap on a list title.',
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold)),
          TextSpan(
              text: 'to edit it...\n ',
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }



  Widget customDynamicWidget() {
    if (widget.position == 1) {
      return Expanded(
        child: Align(alignment:Alignment.bottomCenter,
          child: Transform.translate(
            offset: Offset(0, animation.value),
            child: Container(
              height: 400,
              width: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/demo.png'),
                      fit:BoxFit.fill
                  )),
            ),
          ),
        ),
      );
    } else if (widget.position == 2||widget.position == 3||widget.position == 4||widget.position == 5) {
      return Expanded(
        child: Align(alignment:Alignment.bottomCenter,
          child: Container(
              height: 400,
              width: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/demo.png'),
                      fit:BoxFit.fill
                  )),
            ),
        ),
      );
    }
  }

}
