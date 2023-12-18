import 'package:flutter/material.dart';

class Pergunta07 extends StatefulWidget {
  const Pergunta07({Key? key}) : super(key: key);

  @override
  _Pergunta07State createState() => _Pergunta07State();
}

class _Pergunta07State extends State<Pergunta07> {
  final TextEditingController _numeroController = TextEditingController();
  String _sequence = '';

  String calcularSoma(int numero) {
    int soma = 0;
    String sequence = '';

    for (int i = numero - 1; i >= 1; i--) {
      soma += i;
      sequence += '$i';

      // Adicionando o sinal de adição se não for o último número
      if (i != 1) {
        sequence += ' + ';
      }
    }

    sequence += ' = $soma';

    return sequence;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculando - 7'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _numeroController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite um número inteiro',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int? numero = int.tryParse(_numeroController.text);

                if (numero != null && numero > 0) {
                  return setState(() {
                    _sequence = calcularSoma(numero);
                  });
                }

                return setState(() {
                  _sequence = '';
                });
              },
              child: const Text('Calcular Soma'),
            ),
            const SizedBox(height: 20),
            Text(
              'Sequência: $_sequence',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
