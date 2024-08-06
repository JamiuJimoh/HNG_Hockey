
import 'package:flutter/material.dart';

import 'pucker.dart';

class GameEngine extends ChangeNotifier {
  final Size world;
  GameEngine({required this.world}) {
    _pucker1Position =
        Offset((world.width / 2) - puckerRadius, world.height - puckerSize);
    _pucker2Position = Offset((world.width / 2) - puckerRadius, 0);
  }

  double get puckerSize => 55.0;
  double get puckerRadius => puckerSize / 2;
  double get boundaryLineHeight => 2.0;
  double get boundaryLineWidth => world.width;
  var _pucker1Position = const Offset(0, 0);
  var _pucker2Position = const Offset(0, 0);
  Offset get pucker1Position => _pucker1Position;
  Offset get pucker2Position => _pucker2Position;

  Offset get boundaryLinePosition {
    return Offset(0, (world.height / 2) - boundaryLineHeight);
  }

  PuckerBoundaries get player1Boundaries {
    return PuckerBoundaries(
      left: 0,
      right: world.width - puckerSize,
      top: boundaryLinePosition.dy - puckerRadius,
      bottom: world.height - puckerSize,
    );
  }

  PuckerBoundaries get player2Boundaries {
    return PuckerBoundaries(
      left: 0,
      right: world.width - puckerSize,
      top: 0,
      bottom: boundaryLinePosition.dy - puckerRadius,
    );
  }

  set puckerPosition(Offset offset) {
    if (offset.dx >= player2Boundaries.left &&
        offset.dx <= player2Boundaries.right &&
        offset.dy >= player2Boundaries.top &&
        offset.dy <= player2Boundaries.bottom) {
      _pucker2Position = offset;
      notifyListeners();
    } else if (offset.dx >= player1Boundaries.left &&
        offset.dx <= player1Boundaries.right &&
        offset.dy >= player1Boundaries.top &&
        offset.dy <= player1Boundaries.bottom) {
      _pucker1Position = offset;
      notifyListeners();
    }
  }
}

