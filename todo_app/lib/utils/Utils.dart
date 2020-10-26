import 'package:flutter/material.dart';
import 'dart:math';
import 'package:random_color/random_color.dart';

class Utils {
   static Color random() {
     RandomColor _randomColor = RandomColor();
     return _randomColor.randomColor(colorHue: ColorHue.red);
  }
}
