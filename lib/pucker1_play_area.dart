import 'package:flutter/material.dart';
import 'package:hockey/center_circle_with_line.dart';
import 'package:provider/provider.dart';

import 'ball_painter.dart';
import 'puck_state.dart';
import 'pucker.dart';
import 'pucker1_state.dart';

class Pucker1PlayArea extends StatelessWidget {
  const Pucker1PlayArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final p1 = context.watch<Pucker1State>();
        // final ps = context.watch<PuckState>();
        return GestureDetector(
          onPanStart: (details) {
            p1.pucker1Position = details.localPosition;
            // ps.detectCollision(
            //   p1.pucker1Position.dx,
            //   p1.pucker1Position.dy,
            //   p1.puckerRadius,
            // );
            // print(details.localPosition);
          },
          onPanDown: (details){

            // print(details.localPosition);
          },
          onPanUpdate: (details) {
            p1.pucker1Position = details.localPosition;
            // ps.detectCollision(
            //   p1.pucker1Position.dx,
            //   p1.pucker1Position.dy,
            //   p1.puckerRadius,
            // print('=======================');
            // print(p1.pucker1PrevPosition);
            // print(p1.pucker1Position);
            // print('=======================');
            // );
          },
          onPanEnd: (details) {
          },
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            child: Stack(
              children: [
                CustomPaint(
                  painter: BallPainter(
                    isDonut: true,
                    color: Colors.green,
                    radius: p1.puckerRadius,
                    x: p1.pucker1Position.dx,
                    y: p1.pucker1Position.dy,
                  ),
                ),
                // Pucker(
                //   color: Colors.green,
                //   size: p1.puckerSize,
                //   x: p1.pucker1Position.dx,
                //   y: p1.pucker1Position.dy,
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
