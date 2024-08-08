import 'package:audioplayers/audioplayers.dart';

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

