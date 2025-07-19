import 'package:flutter/material.dart';
import 'package:hangman_games/game_logic.dart';

Widget buildEndMessage(GameLogic logic) {
  if (logic.isGameOver) {
    return Text('Game Over! Word: ${logic.selectedWord}');
  }
  if (logic.isGameWon) return Text('You Won! 🎉');
  if (logic.isHint) {
    return Text('Here is your hint :${logic.theHint}');
  }
  return SizedBox.shrink();
}
