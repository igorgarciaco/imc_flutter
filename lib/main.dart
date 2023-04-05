import 'package:flutter/material.dart';

void main() {
  runApp(IMCCalculator());
}

class IMCCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculadora de IMC'),
        ),
        body: IMCCalculatorForm(),
      ),
    );
  }
}

class IMCCalculatorForm extends StatefulWidget {
  @override
  _IMCCalculatorFormState createState() => _IMCCalculatorFormState();
}

class _IMCCalculatorFormState extends State<IMCCalculatorForm> {
  final _formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  double _imc = 0;

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _weightController,
              decoration: InputDecoration(
                labelText: 'Peso (kg)',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Informe o peso*';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _heightController,
              decoration: InputDecoration(
                labelText: 'Altura (cm)',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Informe altura *';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    final weight = double.parse(_weightController.text);
                    final height = double.parse(_heightController.text) / 100.0;
                    _imc = weight / (height * height);
                  });
                }
              },
              child: Text('Calcular'),
            ),
            SizedBox(height: 16.0),
            Text(
              _imc == null ? 'IMC' : 'IMC ${_imc.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 24.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
