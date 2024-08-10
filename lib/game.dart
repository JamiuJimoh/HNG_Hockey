import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hockey/court_painter.dart';
import 'package:hockey/game_score_state.dart';
import 'package:hockey/goal_post_semi_circle.dart';

import 'package:hockey/palette.dart';

import 'center_circle_with_line.dart';

import 'package:flutter/scheduler.dart';
import 'package:hockey/court_arc_painter.dart';
import 'package:hockey/game_loop.dart';
import 'package:hockey/puck.dart';
import 'package:hockey/scores_hud.dart';
import 'package:provider/provider.dart';

import 'center_circle_with_line.dart';
import 'manage_sound.dart';
import 'palette.dart';
import 'puck_play_area.dart';
import 'puck_state.dart';

import 'pucker1_play_area.dart';
import 'pucker1_state.dart';
import 'pucker2_play_area.dart';
import 'pucker2_state.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  void initState() {
    super.initState();

    ManageSound.stopGameSound();
  }

  @override
  Widget build(BuildContext context) {
// print(SchedulerBinding.instance.window.display.refreshRate);
    return LayoutBuilder(
      builder: (_, constraints) {
        final size = Size(
          constraints.maxWidth,
          constraints.maxHeight,
        );
        final arcRadiuc = size.width / 2;
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
            ChangeNotifierProvider(create: (_) => GameScoreState()),
            ChangeNotifierProxyProvider3<Pucker1State, Pucker2State, GameScoreState, PuckState>(
              create: (ctx) {
                final p1State = ctx.read<Pucker1State>();
                final p2State = ctx.read<Pucker2State>();
                final scoreState = ctx.read<GameScoreState>();
                return PuckState(
                  world: Size(constraints.maxWidth, constraints.maxHeight),
                  p1State: p1State,
                  p2State: p2State,
                  // scoreState: scoreState,
                );
              },
              update: (_, __, ___, ____, state) {
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
          child: Consumer<GameLoop>(
            builder: (_, gameLoop, __) {
              return Container(
                height: size.height,
                width: size.width,
                color: Palette.bg,
                child: Stack(
                  children: [
                    // CourtPostArc(availableSize: size),
                    // GoalPostSemiCircle(availableSize: size),

                    CustomPaint(
                      painter: CourtPainter(
                        availablesize: size,
                      ),
                    ),
                    CustomPaint(
                      painter: CourtArc(
                        x: arcRadiuc / 2,
                        y: 0.0,
                        radius: arcRadiuc,
                        sweepAngle: pi,
                      ),
                    ),
                    CustomPaint(
                      painter: CourtArc(
                        x: arcRadiuc / 2,
                        y: size.height,
                        radius: arcRadiuc,
                        sweepAngle: -pi,
                      ),
                    ),
                    CenterCircleWithLine(availableSize: size),
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
          ),
        );
      },
    );
  }
}
