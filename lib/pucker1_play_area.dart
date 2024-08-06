
import 'package:flutter/material.dart';
import 'package:hockey/center_circle_with_line.dart';
import 'package:provider/provider.dart';

import 'pucker.dart';
import 'pucker1_state.dart';

class Pucker1PlayArea extends StatelessWidget {
  const Pucker1PlayArea({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return ChangeNotifierProvider(
          create: (_) => Pucker1State(
            boundaryLineHeight: boundaryLineHeight,
            world: Size(constraints.maxWidth, constraints.maxHeight),
          ),
          child: Consumer(
            builder: (context, ref, child) {
              final p1 = context.watch<Pucker1State>();
              return GestureDetector(
                onPanStart: (details) {
                  p1.pucker1Position = details.localPosition;
                },
                onPanUpdate: (details) {
                  p1.pucker1Position = details.localPosition;
                },
                child: Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Pucker(
                        color: Colors.green,
                        size: p1.puckerSize,
                        x: p1.pucker1Position.dx,
                        y: p1.pucker1Position.dy,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
