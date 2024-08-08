
import 'package:flutter/material.dart';
import 'package:hockey/palette.dart';

class Puck extends StatelessWidget {
  const Puck({
    super.key,
    required this.size,
    required this.x,
    required this.y,
    this.color,
  });
  final double size;
  final double x;
  final double y;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 70),
      width: size,
      height: size,
      padding: const EdgeInsets.all(11),
      transform: Matrix4.translationValues(x, y, 0),
      decoration: BoxDecoration(
        color:color?? Palette.player,
        borderRadius: BorderRadius.circular(size),
      ),
    );
  }
}

class PuckBoundaries {
  final double left;
  final double right;
  final double top;
  final double bottom;

  PuckBoundaries(
      {required this.left,
      required this.right,
      required this.top,
      required this.bottom});
}
