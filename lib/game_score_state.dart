import 'package:flutter/material.dart';

class GameScoreState extends ChangeNotifier {
  var _scoreBoard = (0, 0);

  int get pucker1Score => _scoreBoard.$1;
  int get pucker2Score => _scoreBoard.$2;

  void puck1Scored() {
    _scoreBoard = (_scoreBoard.$1 + 1, _scoreBoard.$2);
    notifyListeners();
  }

  void puck2Scored() {
    _scoreBoard = (_scoreBoard.$1, _scoreBoard.$2 + 1);
    notifyListeners();
  }
}
