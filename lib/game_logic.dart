import 'dart:math';

class GameLogic {
  List<Map<String, String>> wordList = [];

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

  GameLogic() {
    startNewGame();
  }

  void startNewGame() {
    final random = Random();
    theWord = words[random.nextInt(words.length)].toUpperCase();
    List<String> splitWords = theWord.split('-');
    selectedWord = splitWords[0];
    theHint = splitWords[1];
    guessedLetters = [];
    lives = 5;
  }

  void guessLetter(String letter) {
    if (!guessedLetters.contains(letter)) {
      guessedLetters.add(letter);
      if (!selectedWord.contains(letter)) {
        lives--;
      }
    }
  }

  bool get isHint => lives == 1;
  bool get isGameOver => lives == 0;
  bool get isGameWon =>
      selectedWord.split('').every((letter) => guessedLetters.contains(letter));
}
