
import 'dart:io';
import 'dart:math';

void main() {
  final Random random = Random.secure();

  // Generate a four-digit number with no repeated digits.
  final List<int> digits = List.generate(10, (i) => i);
  digits.shuffle(random);

  // The first digit must not be zero.
  if (digits[0] == 0) {
    final int nonZeroIndex =
        digits.indexWhere((digit) => digit != 0);
    final int temp = digits[0];
    digits[0] = digits[nonZeroIndex];
    digits[nonZeroIndex] = temp;
  }

  final String secret = digits.take(4).join();
  int guesses = 0;

  print('===== COWS AND BULLS GAME =====');
  print('Guess the secret four-digit number.');
  print('Cows: correct digit in the correct position.');
  print('Bulls: correct digit in the wrong position.');
  print('All four digits in the correct positions wins!\n');

  while (true) {
    stdout.write('Enter your four-digit guess: ');
    final String guess = stdin.readLineSync()?.trim() ?? '';

    if (guess.length != 4 ||
        int.tryParse(guess) == null ||
        guess.startsWith('0') ||
        guess.split('').toSet().length != 4) {
      print(
        'Invalid guess. Enter four different digits, '
        'with no leading zero.\n',
      );
      continue;
    }

    guesses++;

    if (guess == secret) {
      print('\nCongratulations! You guessed the number.');
      print('Secret number: $secret');
      print('Total guesses: $guesses');
      break;
    }

    int cows = 0;
    int bulls = 0;

    for (int i = 0; i < 4; i++) {
      if (guess[i] == secret[i]) {
        cows++;
      } else if (secret.contains(guess[i])) {
        bulls++;
      }
    }

    print('Cows: $cows | Bulls: $bulls\n');
  }
}
