import 'package:flutter/material.dart';

import 'pucker.dart';

class Pucker1State extends ChangeNotifier {
  final Size world;
  final double boundaryLineHeight;
  Pucker1State({
    required this.boundaryLineHeight,
    required this.world,
  }) {
    _pucker1Position = Offset((world.width / 2), world.height - puckerRadius);
  }
  double get puckerSize => 55.0;
  double get puckerRadius => puckerSize / 2;
  double get boundaryLineWidth => world.width;
  var _pucker1Position = const Offset(0, 0);
  var _pucker1PrevPosition = const Offset(0, 0);
  Offset get pucker1Position => _pucker1Position;
  Offset get pucker1PrevPosition => _pucker1PrevPosition;

  // a subtle detail...
  // the pucker is aligned by the topLeft "FROM" the pointer
  // where it's being tapped or dragged.
  // Using this trick to push the point to the bottomCenter of the
  // pucker.
  double get cursorYOffset => puckerRadius;
  double get cursorXOffset => puckerRadius / 8;

  // bool get inGoal {
  //   final postStart = world.width * 1 / 3;
  //   final postEnd = world.width * 2 / 3;
  //   if (pucker1Position.dx >= postStart && pucker1Position.dx <= postEnd) {
  //     return true;
  //   }
  //   return false;
  // }
  //
  // double get puck1GoalBoundary {
  //   var b = world.height - puckerRadius + cursorYOffset;
  //   if (inGoal ) {
  //     b = world.height + puckerRadius + cursorYOffset;
  //   }
  //   return b;
  // }

  PuckerBoundaries get player1Boundaries {
    return PuckerBoundaries(
      left: 0 + cursorXOffset + puckerRadius,
      right: world.width - puckerRadius + cursorXOffset,
      top: cursorYOffset - boundaryLineHeight,
      bottom: world.height - puckerRadius + cursorYOffset,
      // bottom: puck1GoalBoundary,
    );
  }

  set pucker1Position(Offset offset) {
    if (offset.dx >= player1Boundaries.left &&
        offset.dx <= player1Boundaries.right &&
        offset.dy >= player1Boundaries.top &&
        offset.dy <= player1Boundaries.bottom) {
      _pucker1PrevPosition = _pucker1Position;
      _pucker1Position = Offset(
        offset.dx - cursorXOffset,
        offset.dy - cursorYOffset,
      );
      notifyListeners();
    }
  }
}
