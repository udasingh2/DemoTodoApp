import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flip_card/flip_card.dart';
import 'package:todoapp/utils/Utils.dart';
import 'package:todoapp/utils/app_colors.dart';
import 'package:todoapp/model/CardModel.Dart';

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

  List<CardModel> entries;

  List<int> colorCodes;

  addToEntries() {
    entries.add(
        CardModel('Swipe to the right to complete!', false, Utils.random()));
    entries
        .add(CardModel('Swipe to the left to delete!', false, Utils.random()));
    entries.add(CardModel('Tap and hold to pick me up', false, Utils.random()));
    entries
        .add(CardModel('Pull down to create an item', false, Utils.random()));
    entries.add(
        CardModel('Try pinching to verticaly shut', false, Utils.random()));
    entries.add(CardModel('Pull up to clear', false, Utils.random()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode = FocusNode();
    entries = List();
    colorCodes = List();
    addToEntries();
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
            key: ValueKey(entries[index].name),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                entries[index].isStrike = true;
                entries[index].color = Colors.black;
                _onReorder(index, entries.length);
              } else if (direction == DismissDirection.endToStart) {
                setState(() {
                  entries.removeAt(index);
                });
              }
            },
            background: Container(color: Colors.green),
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
        color: entries[index].color,
        child: Padding(
            padding: EdgeInsets.fromLTRB(20, 25, 10, 10),
            child: Text(entries[index].name,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.listTextColor,
                    decoration: (entries[index].isStrike)
                        ? TextDecoration.lineThrough
                        : TextDecoration.none))),
      ),
    );
  }

  Widget customHeader() {
    return CustomHeader(builder: (c, m) {
      return Container(
          height: 70,
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
                  if (text.length > 0) {
                    setState(() {
                      entries.insert(
                          0, CardModel(text, false, Colors.redAccent));
                      textFiledController.text = '';
                    });
                  }
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
        final CardModel item = entries.removeAt(oldIndex);
        item.isStrike = true;
        item.color = Colors.black;
        entries.insert(newIndex, item);
      },
    );
  }
}
