import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hockey/main.dart';
import 'package:hockey/pucker1_state.dart';
import 'package:vector_math/vector_math.dart' as vec;

import 'game_loop.dart';
import 'pucker2_state.dart';

class PuckState extends ChangeNotifier {
  final Size world;
  final Pucker1State p1State;
  final Pucker2State p2State;
  PuckState({
    required this.world,
    required this.p1State,
    required this.p2State,
  }) {
    _puckPosition = Offset((world.width / 2), (world.height / 2));
  }

  double get puckSize => 30.0;
  double get puckRadius => puckSize / 2;
  var _puckPosition = const Offset(0, 0);
  Offset get puckPosition => _puckPosition;
  static const _velocity = 200;

  var _prevPositionX = 0.0;
  var _prevPositionY = 0.0;

  PuckBoundaries get puckBoundaries {
    return PuckBoundaries(
      left: 0 + puckRadius,
      right: world.width - puckRadius,
      top: 0 + puckRadius,
      bottom: world.height - puckRadius,
    );
  }

  void draw(double deltaTime) {
    // print(elapsed.inMilliseconds);
    move(deltaTime);
  }

  void move(double deltaTime) {
    var x = puckPosition.dx;
    var y = puckPosition.dy;

    if (puckPosition.dx <= puckBoundaries.right && _prevPositionX <= x) {
      _prevPositionX = x;
      x = puckPosition.dx + (_velocity * deltaTime);
    } else if (puckPosition.dx >= puckBoundaries.left) {
      _prevPositionX = x;
      x = puckPosition.dx - (_velocity * deltaTime);
    } else {
      _prevPositionX = x;
      x = puckPosition.dx + (_velocity * deltaTime);
    }
    if (puckPosition.dy <= puckBoundaries.bottom && _prevPositionY <= y) {
      _prevPositionY = y;
      y = puckPosition.dy + (_velocity * deltaTime);
    } else if (puckPosition.dy >= puckBoundaries.top) {
      _prevPositionY = y;
      y = puckPosition.dy - (_velocity * deltaTime);
    } else {
      _prevPositionY = y;
      y = puckPosition.dy + (_velocity * deltaTime);
    }

    if (detectPucker1Collision()) {
      final contactPoint = handlePucker1Collision();
      if (contactPoint.x.isNegative) {
        x = puckPosition.dx - (_velocity * deltaTime);
      } else if (!contactPoint.x.isNegative) {
        x = puckPosition.dx + (_velocity * deltaTime);
      }

      if (contactPoint.y.isNegative) {
        y = (puckPosition.dy) - (_velocity * deltaTime);
      } else if (!contactPoint.x.isNegative) {
        y = (puckPosition.dy) + (_velocity * deltaTime);
      }
    } else if (detectPucker2Collision()) {
      final contactPoint = handlePucker2Collision();
      // print(contactPoint);
      if (contactPoint.x.isNegative) {
        x = puckPosition.dx - (_velocity * deltaTime);
      } else if (!contactPoint.x.isNegative) {
        x = puckPosition.dx + (_velocity * deltaTime);
      }

      if (contactPoint.y.isNegative) {
        y = (puckPosition.dy) - (_velocity * deltaTime);
      } else if (!contactPoint.x.isNegative) {
        y = (puckPosition.dy) + (_velocity * deltaTime);
      }
    }
    _puckPosition = Offset(x, y);
    notifyListeners();
  }

  bool detectPucker1Collision() {
    final normalizedOtherY = (world.height / 2) + p1State.pucker1Position.dy;
    double dx = _puckPosition.dx - p1State.pucker1Position.dx;
    double dy = _puckPosition.dy - normalizedOtherY;
    double distance = sqrt(dx * dx + dy * dy);
    final collide = distance <= puckRadius + p1State.puckerRadius;
    if (collide) {}
    return collide;
  }

  bool detectPucker2Collision() {
    double dx = _puckPosition.dx - p2State.pucker2Position.dx;
    double dy = _puckPosition.dy - p2State.pucker2Position.dy;
    double distance = sqrt(dx * dx + dy * dy);
    final collide = distance <= puckRadius + p2State.puckerRadius;
    return collide;
  }

  vec.Vector2 handlePucker1Collision() {
    final normalizedOtherY = (world.height / 2) + p1State.pucker1Position.dy;
    final vec.Vector2 centerA =
        vec.Vector2(p1State.pucker1Position.dx, normalizedOtherY);
    final double radiusA = p1State.puckerRadius;

    final vec.Vector2 centerB = vec.Vector2(puckPosition.dx, puckPosition.dy);
    // final double radiusB = puckRadius;
    final vec.Vector2 vectorAB = centerB - centerA;
    final vec.Vector2 direction = vectorAB.normalized();
    final vec.Vector2 contactPoint = direction * radiusA;
    return contactPoint;
  }

  vec.Vector2 handlePucker2Collision() {
    // final normalizedOtherY = (world.height / 2) + p1State.pucker1Position.dy;
    final vec.Vector2 centerA =
        vec.Vector2(p2State.pucker2Position.dx, p2State.pucker2Position.dy);
    final double radiusA = p2State.puckerRadius;

    final vec.Vector2 centerB = vec.Vector2(puckPosition.dx, puckPosition.dy);
    // final double radiusB = puckRadius;
    final vec.Vector2 vectorAB = centerB - centerA;
    final vec.Vector2 direction = vectorAB.normalized();
    final vec.Vector2 contactPoint = direction * radiusA;
    return contactPoint;
  }
}

class PuckBoundaries {
  final double left;
  final double right;
  final double top;
  final double bottom;

  PuckBoundaries({
    required this.left,
    required this.right,
    required this.top,
    required this.bottom,
  });
}

enum PuckMovement { right, left, up, down }
