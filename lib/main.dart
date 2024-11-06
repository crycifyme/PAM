import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const LoanCalculatorApp());
}

class LoanCalculatorApp extends StatelessWidget {
  const LoanCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loan Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LoanCalculatorHomePage(),
    );
  }
}

class LoanCalculatorHomePage extends StatefulWidget {
  const LoanCalculatorHomePage({super.key});

  @override
  State<LoanCalculatorHomePage> createState() => _LoanCalculatorHomePageState();
}

class _LoanCalculatorHomePageState extends State<LoanCalculatorHomePage> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _interestController = TextEditingController();
  double _months = 1;
  String _monthlyPayment = '';

  void _calculatePayment() {
    final double? amount = double.tryParse(_amountController.text);
    final double? interest = double.tryParse(_interestController.text);

    if (amount == null || interest == null) {
      setState(() {
        _monthlyPayment = 'Enter valid values.';
      });
    } else if (amount <= 0) {
      setState(() {
        _monthlyPayment = 'Amount must be greater than zero.';
      });
    } else {
      double monthlyInterestRate = interest / 100;
      double denominator = pow(1 + monthlyInterestRate, _months) - 1;

      if (monthlyInterestRate == 0) {
        double monthlyPayment = amount / _months;
        setState(() {
          _monthlyPayment = monthlyPayment.toStringAsFixed(2);
        });
      } else if (denominator == 0) {
        setState(() {
          _monthlyPayment = 'Invalid interest rate or duration.';
        });
      } else {
        double monthlyPayment =
            (amount * monthlyInterestRate * pow(1 + monthlyInterestRate, _months)) / denominator;

        setState(() {
          _monthlyPayment = monthlyPayment.toStringAsFixed(2);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Loan Calculator',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter amount',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(
                hintText: 'Amount',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter number of months',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Slider(
              value: _months,
              min: 1,
              max: 60,
              divisions: 59,
              label: '${_months.toInt()} luni',
              onChanged: (value) {
                setState(() {
                  _months = value;
                });
              },
              activeColor: Colors.blue,
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter % per month',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            TextField(
              controller: _interestController,
              decoration: const InputDecoration(
                hintText: 'Percent',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  const Text(
                    'You will pay the approximate amount monthly:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _monthlyPayment.isEmpty ? '0.00€' : '$_monthlyPayment€',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: _calculatePayment,
                child: const Text(
                  'Calculate',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}