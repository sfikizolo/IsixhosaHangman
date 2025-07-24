import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hangman_games/game_logic.dart';

Widget actionButtons(
  GameLogic logic,
  VoidCallback refreshUI,
  BuildContext context,
) {
  return Column(
    children: [
      if (logic.isGameWon)
        ElevatedButton(
          onPressed: logic.isGameWon
              ? () {
                  refreshUI();
                  logic.nextWord();
                }
              : null, // disables button when word is not yet guessed
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: Text('Igama Elilandelayo'),
        ),

      if (logic.isGameOver)
        ElevatedButton(
          onPressed: logic.isGameOver
              ? () {
                  refreshUI();
                  logic.startNewGame();
                }
              : null,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),
          child: Text('Phinda Umdlalo'),
        ),

      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        onPressed: () {
          // SystemNavigator.pop(); // This closes the app
          exit(0);
        },
        child: Text('Phuma'),
      ),
    ],
  );
}
