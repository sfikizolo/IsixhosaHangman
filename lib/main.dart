import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(HangmanApp());
}

class HangmanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hangman Game',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HangmanHome(),
    );
  }
}

class HangmanHome extends StatefulWidget {
  @override
  _HangmanHomeState createState() => _HangmanHomeState();
}

class _HangmanHomeState extends State<HangmanHome> {
  final List<String> words = [
    'XHOSA-Ulwimi lwenkobe',
    'ISIPHO-Unikwe ngombiyozo',
    'THANDO-phakathi kwabantu ababini',
    'ikati-isilwanyana esihlala endlini',
  ];
  String selectedWord = '';
  String theWord = ' ';
  String theHint = ' ';
  List<String> guessedLetters = [];
  int lives = 5;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    setState(() {
      final random = Random();
      theWord = words[random.nextInt(words.length)];
      List<String> splitWords = theWord.split('-');
      selectedWord = splitWords[0];
      theHint = splitWords[1];
      guessedLetters = [];
      lives = 5;
    });
  }

  void _guessLetter(String letter) {
    if (!guessedLetters.contains(letter)) {
      setState(() {
        guessedLetters.add(letter);
        if (!selectedWord.contains(letter)) {
          lives--;
        }
      });
    }
  }

  bool get isHint => lives == 1;
  bool get isGameOver => lives == 0;
  bool get isGameWon =>
      selectedWord.split('').every((letter) => guessedLetters.contains(letter));

  Widget _buildWordDisplay() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: selectedWord.split('').map((letter) {
        return Container(
          margin: EdgeInsets.all(4),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 2)),
          ),
          child: Text(
            guessedLetters.contains(letter) ? letter : '_',
            style: TextStyle(fontSize: 32),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildKeyboard() {
    const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: alphabet.split('').map((letter) {
        final alreadyGuessed = guessedLetters.contains(letter);
        return ElevatedButton(
          onPressed: alreadyGuessed || isGameOver || isGameWon
              ? null
              : () => _guessLetter(letter),
          child: Text(letter),
        );
      }).toList(),
    );
  }

  Widget _buildEndMessage() {
    if (isGameOver) return Text('Game Over! Word: $selectedWord');
    if (isGameWon) return Text('You Won! 🎉');
    if (isHint) return Text('Here is your hint :$theHint');
    return SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hangman')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Lives: $lives', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            _buildWordDisplay(),
            SizedBox(height: 30),
            _buildKeyboard(),
            SizedBox(height: 30),
            _buildEndMessage(),
            if (isGameOver || isGameWon)
              ElevatedButton(onPressed: _startNewGame, child: Text('Restart')),
          ],
        ),
      ),
    );
  }
}
