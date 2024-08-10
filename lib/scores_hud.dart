import 'package:flutter/material.dart';
import 'package:hockey/game_score_state.dart';
import 'package:hockey/palette.dart';
import 'package:provider/provider.dart';

class ScoresHUD extends StatelessWidget {
  const ScoresHUD({
    super.key,
    required this.isRunning,
    required this.onTap,
  });
  final bool isRunning;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scoreState = context.watch<GameScoreState>();

    return Container(
      alignment: Alignment.centerRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text(
          //   scoreState.pucker2Score.toString(),
          //   style: TextStyle(color: Palette.player, fontSize: 24),
          // ),
          const SizedBox(height: 10.0),
          GestureDetector(
            onTap: onTap,
            child: Icon(
              isRunning ? Icons.pause : Icons.play_arrow,
              color: Palette.player,
              size: 50,
            ),
          ),
          const SizedBox(height: 10.0),

          GestureDetector(
            onTap: ()=>Navigator.pop(context),
            child: Icon(
              Icons.stop,
              color: Palette.player,
              size: 50,
            ),
          ),
          // Text(
          //   scoreState.pucker1Score.toString(),
          //   style: TextStyle(color: Palette.player, fontSize: 24),
          // ),
        ],
      ),
    );
  }
}
