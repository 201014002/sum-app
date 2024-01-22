import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _numberOneTEController = TextEditingController();
  final TextEditingController _numberTwoTEController = TextEditingController();
  double _result = 0;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sum Calculator',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _numberOneTEController,
                decoration: InputDecoration(hintText: 'Number One'),
                validator: (value) {
                  String v = value ?? '';
                  if (v.isEmpty) {
                    return 'Enter first number';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _numberTwoTEController,
                decoration: InputDecoration(hintText: 'Number Two'),
                validator: (value) {
                  String v = value ?? '';
                  if (v.isEmpty) {
                    return 'Enter second number';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                double numOne = double.tryParse(
                                        _numberOneTEController.text.trim()) ??
                                    0;
                                double numTwo = double.tryParse(
                                        _numberTwoTEController.text.trim()) ??
                                    0;
                                double result = add(numOne, numTwo);
                                _result = result;
                              });
                            }
                          },
                          child: Text('Add'))),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                double numOne = double.tryParse(
                                        _numberOneTEController.text.trim()) ??
                                    0;
                                double numTwo = double.tryParse(
                                        _numberTwoTEController.text.trim()) ??
                                    0;
                                double result = sub(numOne, numTwo);
                                _result = result;
                              });
                            }
                          },
                          child: Text('Sub'))),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: clear, child: Text('Clear'))),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Result: ${_result}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void clear() {
    setState(() {
      _numberOneTEController.clear();
      _numberTwoTEController.clear();
      _result = 0;
    });
  }

  double add(numOne, numTwo) {
    return numOne + numTwo;
  }

  double sub(numOne, numTwo) {
    return numOne - numTwo;
  }
}
