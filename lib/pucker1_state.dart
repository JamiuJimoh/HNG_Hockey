import 'package:flutter/material.dart';

import 'pucker.dart';

class Pucker1State extends ChangeNotifier {
  final Size world;
  final double boundaryLineHeight;
  Pucker1State({
    required this.boundaryLineHeight,
    required this.world,
  }) {
    _pucker1Position =
        Offset((world.width / 2) - puckerRadius, world.height - puckerSize);
  }
  double get puckerSize => 55.0;
  double get puckerRadius => puckerSize / 2;
  double get boundaryLineWidth => world.width;
  var _pucker1Position = const Offset(0, 0);
  Offset get pucker1Position => _pucker1Position;

  // a subtle detail...
  // the pucker is aligned by the topLeft "FROM" the pointer
  // where it's being tapped or dragged.
  // Using this trick to push the point to the bottomCenter of the
  // pucker.
  double get cursorYOffset => puckerSize;
  double get cursorXOffset => puckerSize / 2;

  PuckerBoundaries get player1Boundaries {
    return PuckerBoundaries(
      left: 0 + cursorXOffset,
      right: world.width - puckerSize + cursorXOffset,
      top: (-boundaryLineHeight - puckerRadius) + cursorYOffset,
      bottom: world.height - puckerSize + (cursorXOffset * 2),
    );
  }

  set pucker1Position(Offset offset) {
    if (offset.dx >= player1Boundaries.left &&
        offset.dx <= player1Boundaries.right &&
        offset.dy >= player1Boundaries.top &&
        offset.dy <= player1Boundaries.bottom) {
      _pucker1Position = Offset(
        offset.dx - cursorXOffset,
        offset.dy - cursorYOffset,
      );
      notifyListeners();
    }
  }
}
