import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ball_painter.dart';
import 'center_circle_with_line.dart';
import 'pucker.dart';
import 'pucker2_state.dart';

class Pucker2PlayArea extends StatelessWidget {
  const Pucker2PlayArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final p2 = context.watch<Pucker2State>();
        return GestureDetector(
          onPanStart: (details) {
            p2.pucker2Position = details.localPosition;
          },
          onPanUpdate: (details) {
            p2.pucker2Position = details.localPosition;
          },
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            child: Stack(
              children: [
                CustomPaint(
                  painter: BallPainter(
                    isDonut: true,
                    color: Colors.red,
                    radius: p2.puckerRadius,
                    x: p2.pucker2Position.dx,
                    y: p2.pucker2Position.dy,
                  ),
                ),
                // Pucker(
                //   color: Colors.red,
                //   size: p2.puckerSize,
                //   x: p2.pucker2Position.dx,
                //   y: p2.pucker2Position.dy,
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
