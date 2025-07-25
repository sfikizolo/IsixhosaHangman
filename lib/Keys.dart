import 'package:flutter/material.dart';
import 'game_logic.dart';

Widget buildKeyboard(GameLogic logic, void Function() refreshUI) {
  const onobumba = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  return Wrap(
    spacing: 4,
    runSpacing: 4,
    children: onobumba.split('').map((letter) {
      final alreadyGuessed = logic.guessedLetters.contains(letter);
      return ElevatedButton(
        onPressed: alreadyGuessed || logic.isGameOver || logic.isGameWon
            ? null
            : () {
                logic.guessLetter(letter);
                refreshUI();
              },
        child: Text(letter),
      );
    }).toList(),
  );
}
