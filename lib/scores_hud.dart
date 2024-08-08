import 'package:flutter/material.dart';
import 'package:hockey/palette.dart';

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
    return Container(
      alignment: Alignment.centerRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '0',
            style: TextStyle(color: Palette.player, fontSize: 24),
          ),
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
          Text(
            '0',
            style: TextStyle(color: Palette.player, fontSize: 24),
          ),
        ],
      ),
    );
  }
}

