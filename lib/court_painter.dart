import 'package:flutter/material.dart';

import 'palette.dart';

class CourtPostArc extends StatelessWidget {
  const CourtPostArc({super.key, required this.availableSize});
  final Size availableSize;

  double get height => availableSize.height;
  double get width => availableSize.width;
  double get arcSize => width / 2;
  double get radius => arcSize / 2;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final height = constraints.maxHeight;
        final width = constraints.maxWidth;
        final arcSize = width / 2;
        final radius = arcSize / 2;
        return Container(
          height: arcSize,
          width: arcSize,
          alignment: Alignment(0, height),
          decoration: BoxDecoration(
            border: Border.all(color: Palette.player, width: 2),
            borderRadius: BorderRadius.circular(arcSize),
            color: Colors.transparent,
          ),
        );
      },
    );
  }
}
