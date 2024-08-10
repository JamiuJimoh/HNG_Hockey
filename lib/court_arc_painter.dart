import 'package:flutter/material.dart';

import 'palette.dart';

class CourtArc extends CustomPainter {
  final double x, y, radius, sweepAngle;
  final Color? color;
  CourtArc({
    super.repaint,
    required this.x,
    required this.y,
    required this.radius,
    required this.sweepAngle,
    this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color ?? Palette.player.withOpacity(0.3)
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    final rect = Rect.fromLTWH(x, y - radius / 2, radius, radius);
    // startAngle = 0.0;
    // final sweepAngle = pi;

    canvas.drawArc(
      rect,
      0.0,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
