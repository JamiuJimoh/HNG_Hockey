import 'package:flutter/material.dart';
import 'package:hockey/palette.dart';

class BallPainter extends CustomPainter {
  final double x, y, radius;
  final bool isDonut;
  final Color? color;
  BallPainter({
    super.repaint,
    required this.x,
    required this.y,
    required this.radius,
    this.isDonut = false,
    this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color ?? Palette.player;
    final paint2 = Paint()..color = Palette.bg;

    canvas.drawCircle(Offset(x, y), radius, paint);
    if (isDonut) {
      canvas.drawCircle(Offset(x, y), radius / 2, paint2);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
