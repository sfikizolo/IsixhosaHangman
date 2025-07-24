import 'package:flutter/material.dart';
import 'package:hangman_games/action.dart';
import 'display.dart';
import 'game_logic.dart';
import 'end_message.dart';
import 'Keys.dart';

void main() {
  runApp(HangmanApp());
}

class HangmanApp extends StatelessWidget {
  const HangmanApp({super.key});

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
  const HangmanHome({super.key});

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
            Row(
              children: [
                Text('Lives: ', style: TextStyle(fontSize: 20)),
                ...List.generate(
                  logic.lives,
                  (index) =>
                      Icon(Icons.favorite, color: Colors.pink, size: 24.0),
                ),
              ],
            ),

            SizedBox(height: 20),
            buildWordDisplay(logic),
            SizedBox(height: 30),
            buildKeyboard(logic, () => setState(() {})),
            SizedBox(height: 30),
            buildEndMessage(logic),
            actionButtons(logic, () => setState(() {}), context),
          ],
        ),
      ),
    );
  }
}
