import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hockey/palette.dart';
import 'package:hockey/splash_screen.dart';

import 'package:audioplayers/audioplayers.dart';

import 'game.dart';

class ManageSound {
  static final AudioPlayer _gamePlayer = AudioPlayer();
  static final AudioPlayer _eftsPlayer = AudioPlayer();
  static Future<void> playGameSound() async {
    await _gamePlayer.setReleaseMode(ReleaseMode.loop);
    await _gamePlayer.play(AssetSource('music/gamesound.mp3'));
  }

  static void stopGameSound() {
    _gamePlayer.stop();
  }

  static void pauseGameSound() {
    _gamePlayer.pause();
  }

  static void resumeGameSound() {
    _gamePlayer.resume();
  }

  static void menuClickSound() {
    _eftsPlayer.play(AssetSource('sound_efts/menuclick.wav'));
  }

  static void menuBackSound() {
    _eftsPlayer.play(AssetSource('sound_efts/menuback.wav'));
  }

  static void playerHitPuckSound() {
    _eftsPlayer.play(AssetSource('sound_efts/playerhitpuck.mp3'));
  }

  static void opHitPuckSound() {
    _eftsPlayer.play(AssetSource('sound_efts/ophitpuck.mp3'));
  }

  static void puckHitBoundrySound() {
    _eftsPlayer.play(AssetSource('sound_efts/puckhitsides.wav'));
  }

  static void playerScoresSound() {
    _eftsPlayer.play(AssetSource('sound_efts/playerscores.wav'));
  }

  static void opScoresSound() {
    _eftsPlayer.play(AssetSource('sound_efts/opscores.wav'));
  }

  static void gameOverSound() {
    _eftsPlayer.play(AssetSource('sound_efts/gameover.wav'));
  }


    static void stopGameEftsSound() {
    _gamePlayer.stop();
  }

  static void pauseGameEftsSound() {
    _gamePlayer.pause();
  }

  static void resumeGameEftsSound() {
    _gamePlayer.resume();
  }
}

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

class GameWorld extends StatefulWidget {
  const GameWorld({super.key});

  @override
  State<GameWorld> createState() => _GameWorldState();
}

class _GameWorldState extends State<GameWorld> {
  @override
  void initState() {
    super.initState();
    //had to initialize the theme Sound to test if the sound files work
    ManageSound.playGameSound();
  }

  @override
  void dispose() {
    ManageSound.stopGameSound();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bg,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 20.0),
          decoration: BoxDecoration(
            border: Border.all(color: Palette.player, width: 5),
          ),
          child: const Game(),
        ),
      ),
    );
  }
}
