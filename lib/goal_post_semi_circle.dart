import 'package:flutter/material.dart';

import 'palette.dart';

class GoalPostSemiCircle extends StatelessWidget {
  const GoalPostSemiCircle({super.key, required this.availableSize});
  final Size availableSize;

  double get height => (availableSize.height / 2);

  double get circleSize => (availableSize.width / 2);

  double get radius => circleSize / 2;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: circleSize,
          width: circleSize,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              width: 3.0,
              color: Palette.player.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(circleSize),
          ),
          transform: Matrix4.translationValues(
            circleSize - circleSize / 2,
            availableSize.height - radius,
            0,
          ),
        ),
      ],
    );
  }
}
