import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todoapp/screens/ICloudScreen.dart';

void main(){

  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }
  testWidgets('ChatAppBar UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(makeTestableWidget(child:ICloudScreen()));
    expect(find.byType(Container),findsNWidgets(4));
    expect(find.byType(SizedBox),findsNWidgets(5));
    expect(find.byType(Row),findsNWidgets(1));
  });
}