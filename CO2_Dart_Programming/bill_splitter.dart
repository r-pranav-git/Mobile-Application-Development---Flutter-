
import 'dart:io';

void main() {
  print('========== BILL SPLITTER ==========');

  stdout.write('Enter the total bill amount: ₹');
  final double? totalBill =
      double.tryParse(stdin.readLineSync() ?? '');

  if (totalBill == null || totalBill < 0) {
    print('Invalid bill amount. Please enter a valid amount.');
    return;
  }

  stdout.write('Enter the number of people: ');
  final int? numberOfPeople =
      int.tryParse(stdin.readLineSync() ?? '');

  if (numberOfPeople == null || numberOfPeople <= 0) {
    print('Invalid number of people.');
    return;
  }

  final double amountPerPerson =
      totalBill / numberOfPeople;

  print('\n========== BILL SUMMARY ==========');
  print('Total bill       : ₹${totalBill.toStringAsFixed(2)}');
  print('Number of people : $numberOfPeople');
  print(
    'Amount per person: ₹${amountPerPerson.toStringAsFixed(2)}',
  );
  print('==================================');
}
