import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Pergunta09 extends StatefulWidget {
  const Pergunta09({Key? key}) : super(key: key);

  @override
  _Pergunta09State createState() => _Pergunta09State();
}

class _Pergunta09State extends State<Pergunta09> {
  final TextEditingController _inputController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validarEntrada(String? value) {
    if (value == null || value.isEmpty) {
      return 'Énecessario que você digite numeros';
    }
    return null;
  }

  void _calcularSoma(String input) {
    List<String> numerosString = input.split('-');
    List<int> numeros =
        numerosString.map((num) => int.tryParse(num) ?? 0).toList();

    int soma = numeros
        .where((num) => num < 30)
        .reduce((value, element) => value + element);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Soma dos números menores que 30:'),
          content: Text('A soma dos números é: $soma'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MENORES QUE 30 - 9'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                validator: _validarEntrada,
                controller: _inputController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  MaskTextInputFormatter(mask: '##-##-##-##-##')
                ],
                decoration: const InputDecoration(
                  labelText: 'Digite os números',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String input = _inputController.text;
                    _calcularSoma(input);
                  }
                },
                child: const Text('Calcular Soma'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
