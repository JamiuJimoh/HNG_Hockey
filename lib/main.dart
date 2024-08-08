import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hockey/palette.dart';
import 'package:hockey/splash_screen.dart';

import 'game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  // Lock the game to portrait mode on mobile devices.
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const Hockey());
}

class Hockey extends StatelessWidget {
  const Hockey({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body:
            // GameWorld(),
            SplashScreen(),
      ),
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
          child: const Game(),
        ),
      ),
    );
  }
}
