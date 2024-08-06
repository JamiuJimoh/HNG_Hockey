
import 'package:flutter/material.dart';

import 'center_circle_with_line.dart';
import 'palette.dart';
import 'pucker1_play_area.dart';
import 'pucker2_play_area.dart';

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          color: Palette.bg,
          child: Stack(
            children: [
              CenterCircleWithLine(
                availableSize: Size(
                  constraints.maxWidth,
                  constraints.maxHeight,
                ),
              ),
              const Column(
                children: [
                  Expanded(
                    child: Pucker2PlayArea(),
                  ),
                  Expanded(
                    child: Pucker1PlayArea(),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
