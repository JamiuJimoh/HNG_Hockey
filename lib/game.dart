import 'package:flutter/material.dart';

import 'package:hockey/palette.dart';

import 'center_circle_with_line.dart';

import 'package:flutter/scheduler.dart';
import 'package:hockey/game_loop.dart';
import 'package:hockey/puck.dart';
import 'package:hockey/scores_hud.dart';
import 'package:provider/provider.dart';

import 'center_circle_with_line.dart';
import 'palette.dart';
import 'puck_play_area.dart';
import 'puck_state.dart';

import 'pucker1_play_area.dart';
import 'pucker1_state.dart';
import 'pucker2_play_area.dart';
import 'pucker2_state.dart';

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
// print(SchedulerBinding.instance.window.display.refreshRate);
    return LayoutBuilder(
      builder: (_, constraints) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => Pucker2State(
                boundaryLineHeight: boundaryLineHeight,
                world: Size(constraints.maxWidth, constraints.maxHeight / 2),
              ),
            ),
            ChangeNotifierProvider(
              create: (_) => Pucker1State(
                boundaryLineHeight: boundaryLineHeight,
                world: Size(constraints.maxWidth, constraints.maxHeight / 2),
              ),
            ),
            ChangeNotifierProxyProvider2<Pucker1State, Pucker2State, PuckState>(
              create: (ctx) {
                final p1State = ctx.read<Pucker1State>();
                final p2State = ctx.read<Pucker2State>();
                return PuckState(
                  world: Size(constraints.maxWidth, constraints.maxHeight),
                  p1State: p1State,
                  p2State: p2State,
                );
              },
              update: (_, __, ___, state) {
                return state!;
              },
            ),
            ChangeNotifierProxyProvider<PuckState, GameLoop>(
              create: (ctx) {
                final puckState = ctx.read<PuckState>();
                return GameLoop(puckState.draw);
              },
              update: (_, __, loop) {
                return loop!;
              },
            ),
          ],
          child: LayoutBuilder(
            builder: (_, constraints) {
              return Consumer<GameLoop>(
                builder: (_, gameLoop, __) {
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
                        const PuckPlayArea(),
                        ScoresHUD(
                          isRunning: gameLoop.isRunning,
                          onTap: () {
                            if (gameLoop.isRunning) {
                              gameLoop.gameState = GameState.paused;
                            } else {
                              gameLoop.gameState = GameState.resumed;
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
