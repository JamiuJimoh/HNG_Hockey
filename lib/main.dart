import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hockey/manage_sound.dart';
import 'package:hockey/palette.dart';
import 'package:hockey/splash_screen.dart';

import 'package:audioplayers/audioplayers.dart';

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
        // body: SplashScreen(),
        body: GameWorld(),
      ),
    );
  }
}

class GameWorld extends StatefulWidget {
  const GameWorld({super.key});

  @override
  State<GameWorld> createState() => _GameWorldState();
}

class _GameWorldState extends State<GameWorld> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    //had to initialize the theme Sound to test if the sound files work
    // ManageSound.playGameSound();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    ManageSound.stopGameSound();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      ManageSound.pauseGameSound();
    } else if (state == AppLifecycleState.resumed) {
      ManageSound.resumeGameSound();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bg,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 20.0),
          decoration: BoxDecoration(
            // border: Border.all(color: Palette.player, width: 2),
          ),
          child: const Game(),
        ),
      ),
    );
  }
}
