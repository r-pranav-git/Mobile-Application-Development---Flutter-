
import 'dart:io';
import 'dart:math';

void main() {
  const String lowercase = 'abcdefghijklmnopqrstuvwxyz';
  const String uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const String numbers = '0123456789';
  const String symbols = r'!@#$%^&*()-_+=<>?';

  final Random random = Random.secure();

  print('===== RANDOM PASSWORD GENERATOR =====');

  stdout.write('Enter desired password length (minimum 4): ');
  final int? length = int.tryParse(stdin.readLineSync() ?? '');

  if (length == null || length < 4) {
    print('Please enter a valid length of at least 4.');
    return;
  }

  final String allCharacters =
      lowercase + uppercase + numbers + symbols;

  // Ensure at least one character from each category.
  final List<String> passwordCharacters = [
    lowercase[random.nextInt(lowercase.length)],
    uppercase[random.nextInt(uppercase.length)],
    numbers[random.nextInt(numbers.length)],
    symbols[random.nextInt(symbols.length)],
  ];

  // Fill the remaining positions randomly.
  while (passwordCharacters.length < length) {
    passwordCharacters.add(
      allCharacters[random.nextInt(allCharacters.length)],
    );
  }

  // Shuffle to avoid fixed positions for character categories.
  passwordCharacters.shuffle(random);

  final String password = passwordCharacters.join();

  print('\nGenerated password: $password');
  print('Password length: ${password.length}');
}
