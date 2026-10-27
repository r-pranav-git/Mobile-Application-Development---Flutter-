
import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Calculator',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() =>
      _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController firstController =
      TextEditingController();
  final TextEditingController secondController =
      TextEditingController();

  String result = '';

  void calculate(String operation) {
    final double? a = double.tryParse(firstController.text);
    final double? b = double.tryParse(secondController.text);

    if (a == null || b == null) {
      setState(() => result = 'Enter two valid numbers');
      return;
    }

    double answer;

    switch (operation) {
      case '+':
        answer = a + b;
        break;
      case '-':
        answer = a - b;
        break;
      case '*':
        answer = a * b;
        break;
      case '/':
        if (b == 0) {
          setState(() => result = 'Cannot divide by zero');
          return;
        }
        answer = a / b;
        break;
      default:
        return;
    }

    setState(() => result = 'Result: $answer');
  }

  void clearFields() {
    firstController.clear();
    secondController.clear();
    setState(() => result = '');
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: firstController,
              keyboardType:
                  const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              decoration: const InputDecoration(
                labelText: 'First Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: secondController,
              keyboardType:
                  const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Second Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: [
                operationButton('+'),
                operationButton('-'),
                operationButton('*'),
                operationButton('/'),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              result,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: clearFields,
              icon: const Icon(Icons.clear),
              label: const Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }

  Widget operationButton(String operation) {
    return ElevatedButton(
      onPressed: () => calculate(operation),
      child: Text(
        operation,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
