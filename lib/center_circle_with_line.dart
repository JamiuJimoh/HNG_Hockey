import 'package:flutter/material.dart';

import 'palette.dart';

const boundaryLineHeight = 2.0;

class CenterCircleWithLine extends StatelessWidget {
  const CenterCircleWithLine({super.key, required this.availableSize});
  final Size availableSize;

  double get height => (availableSize.height / 2);

  double get linePositon => height - boundaryLineHeight;

  double get circleSize => (availableSize.width / 2);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: boundaryLineHeight,
          width: double.infinity,
          color: Palette.player,
          transform: Matrix4.translationValues(0, linePositon, 0),
        ),
        Container(
          height: circleSize,
          width: circleSize,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(width: 3.0, color: Palette.player),
            borderRadius: BorderRadius.circular(circleSize),
          ),
          transform: Matrix4.translationValues(
            circleSize - circleSize / 2,
            height - circleSize / 2,
            0,
          ),
        ),
      ],
    );
  }
}
