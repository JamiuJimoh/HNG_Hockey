import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class GameLoop extends ChangeNotifier {
  late Ticker _ticker;
  final void Function(double ) draw;
  GameLoop(this.draw) {
    _ticker = Ticker(_onTick);
    // _start();
  }

  var _state = GameState.ended;
  var _lastTick = Duration.zero;
  var _pauseElapsed = Duration.zero;

  static const seconds = 1000; //milliseconds

  int get fps => 60;
  int get targetFrameTime => seconds~/ fps;

  GameState get state => _state;
  bool get isRunning => _state == GameState.resumed;

  set gameState(GameState state) {
    _state = state;
    _handleGameLoop(state);
    notifyListeners();
  }

  void _handleGameLoop(GameState st) {
     if (st == GameState.paused) {
      _pauseTicker();
    } else if (st == GameState.resumed) {
      _resumeTicker();
    } else if (st == GameState.ended) {
      _stop();
      dispose();
    }
  }

  void _onTick(Duration elapsed) {
    if (_state == GameState.paused) return;
    final deltaTime = (elapsed - _lastTick).inMilliseconds;
    if (deltaTime < targetFrameTime) return;

    draw(deltaTime / seconds);
    _lastTick = elapsed;
  }

  void _pauseTicker() {
    // if (_state == GameState.paused) return;
    _pauseElapsed = _lastTick;
    _state = GameState.paused;
    _stop();
    // notifyListeners();
  }

  void _resumeTicker() {
    // if (_state != GameState.paused) return;
    // if (_pauseElapsed != Duration.zero) {
    //   final pausedDuration =
    //       Duration(milliseconds: DateTime.now().millisecondsSinceEpoch) -
    //           _pauseElapsed;
    //   _lastTick = pausedDuration;
    // }
    _state = GameState.resumed;

    // print(_lastTick.inMilliseconds);
    // print(_pauseElapsed.inMilliseconds);
    _lastTick = _pauseElapsed;
    _start();
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
