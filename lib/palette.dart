// import 'package:flutter/material.dart';

// class Palette {
//   static const bg = Color.fromARGB(94, 187, 208, 255);
//   static const player = Colors.white;

// }

import 'dart:math';
import 'package:flutter/material.dart';

class Palette {
  static const Color bg = Color.fromARGB(94, 187, 208, 255);
  static const Color player = Colors.white;

  static const List<Color> colorList = [
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];

  static Color getRandomColor() {
    final random = Random();
    return colorList[random.nextInt(colorList.length)];
  }
}
