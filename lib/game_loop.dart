import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class GameLoop extends ChangeNotifier {
  late Ticker _ticker;
  final void Function(double) draw;
  GameLoop(this.draw) {
    _ticker = Ticker(_onTick);
    _start();
  }

  var _state = GameState.resumed;
  var _lastTick = Duration.zero;

  static const seconds = 1000; 

  int get fps => 60;
  int get targetFrameTime => seconds ~/ fps;

  GameState get state => _state;
  bool get isRunning => _state == GameState.resumed;

  set gameState(GameState state) {
    _state = state;
    _handleGameLoop(state);
    notifyListeners();
  }

  void _handleGameLoop(GameState st) {
    if (st == GameState.paused) {
      _stop();
    } else if (st == GameState.resumed) {
      _start();
    } else if (st == GameState.ended) {
      _stop();
      dispose();
    }
  }

  void _onTick(Duration elapsed) {
    if (_state == GameState.paused) return;
    final deltaTime = (elapsed - _lastTick);
    _lastTick += deltaTime;
    if (deltaTime.inMilliseconds < targetFrameTime) return;

    draw(deltaTime.inMilliseconds / seconds);
  }

  void _start() {
    _ticker.start();
  }

  void _stop() {
    _ticker.stop();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }
}

enum GameState { paused, resumed, ended }
