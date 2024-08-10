import 'package:flutter/material.dart';

import 'palette.dart';

class CourtPainter extends CustomPainter {
  final Size availablesize;
  final Color? color;
  CourtPainter({super.repaint, required this.availablesize, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color ?? Palette.player.withOpacity(0.3)
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    final postArcRadius = availablesize.width / 2;
    final arcStop = postArcRadius / 2;
    final path = Path()
      ..lineTo(0, 0)
      ..lineTo(0, availablesize.height)
      ..lineTo(arcStop, availablesize.height)
      ..moveTo(arcStop + postArcRadius, availablesize.height)
      ..lineTo(availablesize.width, availablesize.height)
      ..moveTo(availablesize.width, 0)
      ..lineTo(availablesize.width, availablesize.height)
      ..moveTo(0, 0)
      ..lineTo(arcStop, 0)
      ..moveTo(arcStop + postArcRadius, 0)
      ..lineTo(availablesize.width, 0);

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
