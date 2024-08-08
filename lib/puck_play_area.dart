import 'package:flutter/material.dart';
import 'package:hockey/ball_painter.dart';
import 'package:hockey/game_loop.dart';
import 'package:hockey/palette.dart';
import 'package:provider/provider.dart';

import 'puck.dart';
import 'puck_state.dart';

class PuckPlayArea extends StatelessWidget {
  const PuckPlayArea({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return Consumer<PuckState>(
          builder: (context, state, child) {
            return Container(
              color: Colors.transparent,
              width: double.infinity,
              child: Stack(
                children: [
                  CustomPaint(
                    painter: BallPainter(
                      radius: state.puckRadius,
                      x: state.puckPosition.dx,
                      y: state.puckPosition.dy,
                    ),
                  ),
                  // Puck(
                  //   size: state.puckSize,
                  //   x: state.puckPosition.dx,
                  //   y: state.puckPosition.dy,
                  // ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
