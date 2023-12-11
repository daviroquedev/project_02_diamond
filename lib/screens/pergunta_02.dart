import 'package:flutter/material.dart';

class Pergunta02 extends StatefulWidget {
  const Pergunta02({super.key});

  @override
  State<Pergunta02> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Pergunta02> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _numero1Controller = TextEditingController();
  final TextEditingController _numero2Controller = TextEditingController();
  String _resultado = '';

  void _verificarMaior() {
    if (_formKey.currentState!.validate()) {
      int numero1 = int.parse(_numero1Controller.text);
      int numero2 = int.parse(_numero2Controller.text);

      if (numero1 == numero2) {
        setState(() {
          _resultado = 'Os números são iguais! ${_numero1Controller.text}';
        });
      } else {
        int maior = numero1 > numero2 ? numero1 : numero2;
        setState(() {
          _resultado = 'O maior número é: $maior  ${_numero1Controller.text}';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verificar Maior Número'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Digite dois números inteiros diferentes:',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira um número';
                  }
                  return null;
                },
                controller: _numero1Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Número 1',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira um número';
                  }
                  return null;
                },
                controller: _numero2Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Número 2',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _verificarMaior,
                child: const Text('Verificar Maior'),
              ),
              const SizedBox(height: 20),
              Text(
                _resultado,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _numero1Controller.dispose();
    _numero2Controller.dispose();
    super.dispose();
  }
}
