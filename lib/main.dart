import 'package:flutter/material.dart';
import 'package:hockey/engine.dart';
import 'package:hockey/palette.dart';
import 'package:provider/provider.dart';

import 'pucker.dart';

void main() {
  runApp(const Hockey());
}

class Hockey extends StatelessWidget {
  const Hockey({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: GameWorld()),
    );
  }
}

class GameWorld extends StatelessWidget {
  const GameWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bg,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 30.0),
          decoration: BoxDecoration(
            border: Border.all(color: Palette.player, width: 5),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ChangeNotifierProvider(
                create: (_) => GameEngine(
                  world: Size(constraints.maxWidth, constraints.maxHeight),
                ),
                child: const Game(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameEngine>();
    return GestureDetector(
      onPanStart: (details) {
        state.puckerPosition = details.localPosition;
      },
      onPanUpdate: (details) {
        state.puckerPosition = details.localPosition;
      },
      child: Container(
        height: state.world.height,
        width: state.world.width,
        color: Palette.bg,
        child: Stack(
          children: [
            Container(
              width: state.boundaryLineWidth,
              height: state.boundaryLineHeight,
              color: Palette.player,
              transform: Matrix4.translationValues(
                state.boundaryLinePosition.dx,
                state.boundaryLinePosition.dy,
                0,
              ),
            ),
            Pucker(
              size: state.puckerSize,
              x: state.pucker1Position.dx,
              y: state.pucker1Position.dy,
            ),
            Pucker(
              size: state.puckerSize,
              x: state.pucker2Position.dx,
              y: state.pucker2Position.dy,
            ),
          ],
        ),
      ),
    );
  }
}
