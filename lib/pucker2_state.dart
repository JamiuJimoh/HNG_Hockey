import 'dart:math';

import 'package:flutter/material.dart';

import 'pucker.dart';

class Pucker2State extends ChangeNotifier {
  final Size world;
  final double boundaryLineHeight;
  Pucker2State({
    required this.boundaryLineHeight,
    required this.world,
  }) {
    _pucker2Position = Offset((world.width / 2), puckerRadius);
  }
  double get puckerSize => 55.0;
  double get puckerRadius => puckerSize / 2;
  double get boundaryLineWidth => world.width;
  var _pucker2Position = const Offset(0, 0);
  Offset get pucker2Position => _pucker2Position;

  // a subtle detail...
  // the pucker is aligned by the topLeft "FROM" the pointer.
  // where it's being tapped or dragged.
  // Using this trick to push the point to the topCenter of the
  // pucker.
  double get cursorYOffset => -puckerRadius;
  double get cursorXOffset => -(puckerRadius / 8);

  // bool get inGoal {
  //   final postStart = world.width * 1 / 3;
  //   final postEnd = world.width * 2 / 3;
  //   if (pucker2Position.dx >= postStart && pucker2Position.dx <= postEnd) {
  //     return true;
  //   }
  //   return false;
  // }
  //
  // double get puck2GoalBoundary {
  //   var b = 0.0;
  //   if (inGoal) {
  //     b = -puckerRadius;
  //   }
  //   return b;
  // }

  PuckerBoundaries get player2Boundaries {
    return PuckerBoundaries(
      left: 0 + cursorXOffset + puckerRadius,
      right: world.width - puckerRadius + cursorXOffset,
      top: 0,
      // top: puck2GoalBoundary,
      bottom: world.height + cursorYOffset,
    );
  }

  set pucker2Position(Offset offset) {
    if (offset.dx >= player2Boundaries.left &&
        offset.dx <= player2Boundaries.right &&
        offset.dy >= player2Boundaries.top &&
        offset.dy <= player2Boundaries.bottom) {
      _pucker2Position = offset;
      _pucker2Position = Offset(
        offset.dx - cursorXOffset,
        offset.dy - cursorYOffset,
      );
      notifyListeners();
    }
  }
}
