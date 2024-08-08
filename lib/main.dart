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

  static Future<void> stopGameSound() async {
    await _gamePlayer.stop();
  }

  static Future<void> pauseGameSound() async {
    await _gamePlayer.pause();
  }

  static Future<void> resumeGameSound() async {
    await _gamePlayer.resume();
  }

  static Future<void> menuClickSound() async {
    await _eftsPlayer.play(AssetSource('sound_efts/menuclick.wav'));
  }

  static Future<void> menuBackSound() async {
    await _eftsPlayer.play(AssetSource('sound_efts/menuback.wav'));
  }

  static Future<void> playerHitPuckSound() async {
    await _eftsPlayer.play(AssetSource('sound_efts/playerhitpuck.mp3'));
  }

  static Future<void> opHitPuckSound() async {
    await _eftsPlayer.play(AssetSource('sound_efts/ophitpuck.mp3'));
  }

  static Future<void> puckHitBoundrySound() async {
    await _eftsPlayer.play(AssetSource('sound_efts/puckhitsides.wav'));
  }

  static Future<void> playerScoresSound() async {
    await _eftsPlayer.play(AssetSource('sound_efts/playerscores.wav'));
  }

  static Future<void> opScoresSound() async {
    await _eftsPlayer.play(AssetSource('sound_efts/opscores.wav'));
  }

  static Future<void> gameOverSound() async {
    await _eftsPlayer.play(AssetSource('sound_efts/gameover.wav'));
  }

  static Future<void> stopGameEftsSound() async {
    await _gamePlayer.stop();
  }

  static Future<void> pauseGameEftsSound() async {
    await _gamePlayer.pause();
  }

  static Future<void> resumeGameEftsSound() async {
    await _gamePlayer.resume();
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
            border: Border.all(color: Palette.player, width: 5),
          ),
          child: const Game(),
        ),
      ),
    );
  }
}
