import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flip_card/flip_card.dart';

class PersonalList extends StatefulWidget {
  @override
  PersonalListState createState() => PersonalListState();
}

class PersonalListState extends State<PersonalList>
    with SingleTickerProviderStateMixin {
  RefreshController _refreshController = RefreshController();
  TextEditingController textFiledController = TextEditingController();

  AnimationController _animationController;
  Animation _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;
  int tappedIndex;
  FocusNode _focusNode;

  List<String> entries;

  List<int> colorCodes;

  refreshlist() {
    setState(() {
      entries.insert(0, 'A new value added');
      colorCodes.insert(0, 500);
    });
    print(entries);
    return null;
  }

  addToEntries() {
    entries.add('Swipe to the right to complete!');
    entries.add('Swipe to the left to delete!');
    entries.add('Tap and hold to pick me up');
    entries.add('Pull down to create an item');
    entries.add('Try pinching to verticaly shut');
    entries.add('Pull up to clear');
  }

  addToColorCodes() {
    colorCodes.add(600);
    colorCodes.add(500);
    colorCodes.add(400);
    colorCodes.add(300);
    colorCodes.add(200);
    colorCodes.add(100);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode = FocusNode();
    entries = List();
    colorCodes = List();
    addToEntries();
    addToColorCodes();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween(end: 1, begin: 0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _animationStatus = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: entries.length > 0
          ? SmartRefresher(
              enablePullUp: true,
              header: customHeader(),
              controller: _refreshController,
              child: list(),
              onRefresh: () {
                _focusNode.requestFocus();
                // _refreshController.refreshCompleted();
              },
            )
          : Center(child: const Text('No items')),
    ));
  }

  Widget list() {
    return ReorderableListView(
      onReorder: _onReorder,
      scrollDirection: Axis.vertical,
      children: List.generate(
        entries.length,
        (index) {
          return Dismissible(
            key: Key(entries[index]),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {


              } else if (direction == DismissDirection.endToStart) {
                setState(() {
                  entries.removeAt(index);
                });

              }
            },
            background: Container(color: Colors.black),
            secondaryBackground: Container(
              color: Colors.black,
              child: Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
                alignment: Alignment.centerRight,
              ),
            ),
            child: row(context, index),
          );
        },
      ),
    );
  }

  Widget row(context, index) {
    return Expanded(
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        color: Colors.red[colorCodes[index]],
        child: Padding(
            padding: EdgeInsets.fromLTRB(20, 25, 10, 10),
            child: Text(entries[index],
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))),
      ),
    );
  }

  Widget customHeader() {
    return CustomHeader(builder: (c, m) {
      return Container(
          height: 80,
          color: Colors.redAccent,
          padding: EdgeInsets.only(top: 20.0, left: 20),
          child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.002)
                ..rotateX(pi * _animation.value),
              child: TextField(
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                focusNode: _focusNode,
                controller: textFiledController,
                onSubmitted: (String text) {
                  _refreshController.refreshCompleted();
                  setState(() {
                    entries.insert(0, text);
                    colorCodes.insert(0, 500);
                  });
                },
              )));
    });
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(
      () {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final String item = entries.removeAt(oldIndex);
        final int citem = colorCodes.removeAt(oldIndex);
        entries.insert(newIndex, item);
        colorCodes.insert(newIndex, citem);
      },
    );
  }

}
