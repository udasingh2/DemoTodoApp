import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:todoapp/model/CardModel.Dart';

void main() {
  test('this is a unit test', () {
    CardModel model = CardModel('Rahul', true, Colors.green);
    expect(model.name, 'Rahul');
    expect(model.isStrike, true);
    expect(model.color, Colors.green);
  });
}
