import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todoapp/screens/SignInScreen.dart';


class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main(){

  NavigatorObserver mockNavigationObserver;



  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  setUp(() {
    mockNavigationObserver = MockNavigatorObserver();
  });

  testWidgets('SignInScreen email Filed Test', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child:SignInScreen()));
    Finder emailField = find.byKey(Key('email'));
    await tester.enterText(emailField, 'email');
    expect(find.text('email'), findsOneWidget);

  });


//  testWidgets('find one FlatButton', (WidgetTester tester) async {
//    await tester.pumpWidget(FlatButton.icon(
//        onPressed: (){},
//        icon: Icon(Icons.access_alarm),
//        label: Text('remind me')
//    ));
//    expect(tester.widget<FlatButton>(find.byKey(buttonKey)).enabled, isFalse);
//    //verify(mockNavigationObserver.didPush(any, any));
//  });

}