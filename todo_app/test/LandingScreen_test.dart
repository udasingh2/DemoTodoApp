// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/screens/LandingScreen.dart';
import 'package:todoapp/screens/WelcomeScreen.dart';

void main() {
  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }
  testWidgets('LandingScreen Ui Test', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child:LandingScreen(title: 'clear')));
//    expect(find.byType(Container),findsNWidgets(1));
//    expect(find.byType(Column),findsNWidgets(1));
//    expect(find.byType(RichText),findsNWidgets(2));
  });
}