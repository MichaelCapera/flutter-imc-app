import 'package:flutter/material.dart';

void main() {
  runApp(IMCCalculatorApp());
}

class IMCCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IMCCalculator(),
    );
  }
}

class IMCCalculator extends StatefulWidget {
  @override
  _IMCCalculatorState createState() => _IMCCalculatorState();
}

class _IMCCalculatorState extends State<IMCCalculator> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _result = 0;

  void _calculateIMC() {
    final double height = double.tryParse(_heightController.text) ?? 0;
    final double weight = double.tryParse(_weightController.text) ?? 0;

    if (height > 0 && weight > 0) {
      setState(() {
        _result = weight / (height * height);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _heightController,
              decoration: InputDecoration(
                labelText: 'Altura (metros)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(
                labelText: 'Peso (kilogramos)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculateIMC,
              child: Text('Calcular IMC'),
            ),
            SizedBox(height: 16),
            Text(
              _result == 0 ? '' : 'Tu IMC es: ${_result.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
