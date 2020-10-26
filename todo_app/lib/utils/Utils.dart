import 'package:flutter/material.dart';
import 'dart:math';

class Utils {
   static int random() {
     Random random = new Random();
    return random.nextInt(6) * 100;
  }
}
