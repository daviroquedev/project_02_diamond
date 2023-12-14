import 'package:flutter/material.dart';

class Pergunta01 extends StatefulWidget {
  const Pergunta01({Key? key}) : super(key: key);

  @override
  State<Pergunta01> createState() => _Pergunta01State();
}

class _Pergunta01State extends State<Pergunta01> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _numberController = TextEditingController();
  String _result = '';

  void _verificarPar() {
    if (_formKey.currentState!.validate()) {
      int? number = int.tryParse(_numberController.text);
      setState(() {
        _result = (number != null && number % 2 == 0)
            ? 'O número é PAR!'
            : 'O número não é PAR!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Par ou Impar'),
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
                'Verifique se o número é par:',
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
                controller: _numberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Digite o número',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _verificarPar,
                child: const Text('Verificar'),
              ),
              const SizedBox(height: 20),
              Text(
                _result,
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
    _numberController.dispose();
    super.dispose();
  }
}
