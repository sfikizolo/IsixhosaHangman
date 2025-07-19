import 'package:flutter/material.dart';
import 'game_logic.dart';

Widget buildWordDisplay(GameLogic logic) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: logic.selectedWord.split('').map((letter) {
      return Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 2))),
        child: Text(
          logic.guessedLetters.contains(letter) ? letter : '_',
          style: TextStyle(fontSize: 32),
        ),
      );
    }).toList(),
  );
}
