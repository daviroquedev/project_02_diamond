import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Pergunta10 extends StatefulWidget {
  const Pergunta10({Key? key}) : super(key: key);

  @override
  _Pergunta10State createState() => _Pergunta10State();
}

class _Pergunta10State extends State<Pergunta10> {
  final TextEditingController _inputController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _contarMaioresQue50(String input) {
    List<String> numerosString = input.split('/');
    List<int> numeros =
        numerosString.map((num) => int.tryParse(num) ?? 0).toList();

    int maioresQue50 = numeros.where((num) => num > 50).length;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Numeros maiores que 50:'),
          content: Text('Quantidade de valores: $maioresQue50'),
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
        title: const Text('Quantidade de Valores Maiores que 50 - 10'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _inputController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  MaskTextInputFormatter(mask: '##/##/##/##/##')
                ],
                decoration: const InputDecoration(
                  labelText: 'Digite os números',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'É necessário que você digite números';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String input = _inputController.text;
                    _contarMaioresQue50(input);
                  }
                },
                child: const Text('Verificar Números'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
