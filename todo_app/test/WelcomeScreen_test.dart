import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todoapp/screens/WelcomeScreen.dart';

void main(){

  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }
  testWidgets('ChatAppBar UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(makeTestableWidget(child:WelcomeScreen()));
    expect(find.byType(Container),findsNWidgets(2));
    expect(find.byType(Column),findsNWidgets(1));
    expect(find.byType(RichText),findsNWidgets(2));
  });
}