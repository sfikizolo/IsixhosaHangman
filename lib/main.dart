import 'package:flutter/material.dart';
import 'display.dart';
import 'game_logic.dart';
import 'end_message.dart';
import 'Keys.dart';
import 'custom.dart';

void main() {
  runApp(HangmanApp());
}

class HangmanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hangman Game',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: HangmanHome(),
    );
  }
}

class HangmanHome extends StatefulWidget {
  @override
  _HangmanHomeState createState() => _HangmanHomeState();
}

class _HangmanHomeState extends State<HangmanHome> {
  final GameLogic logic = GameLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hangman')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Lives: ${logic.lives}', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            buildWordDisplay(logic),
            SizedBox(height: 30),
            buildKeyboard(logic, () => setState(() {})),
            SizedBox(height: 30),
            buildEndMessage(logic),
            if (logic.isGameOver || logic.isGameWon)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    logic.startNewGame();
                  });
                },
                child: Text('Restart'),
              ),
          ],
        ),
      ),
    );
  }
}
