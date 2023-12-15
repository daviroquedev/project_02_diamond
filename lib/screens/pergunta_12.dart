import 'package:flutter/material.dart';

class Pergunta12 extends StatefulWidget {
  const Pergunta12({Key? key}) : super(key: key);

  @override
  _Pergunta12State createState() => _Pergunta12State();
}

class _Pergunta12State extends State<Pergunta12> {
  final TextEditingController _textoController = TextEditingController();
  String resultado = '';

  void processarString(String texto) {
    if (texto.isNotEmpty) {
      String primeiraLetra = texto[0].toUpperCase();
      String ultimaLetra = texto[texto.length - 1].toUpperCase();
      setState(() {
        resultado =
            primeiraLetra + texto.substring(1, texto.length - 1) + ultimaLetra;
      });
    } else {
      setState(() {
        resultado = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maiusculas - 12'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _textoController,
              decoration: const InputDecoration(
                labelText: 'Digite algo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String texto = _textoController.text;
                processarString(texto);
              },
              child: const Text('Processar Texto'),
            ),
            const SizedBox(height: 20),
            Text(
              'Resultado: $resultado',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textoController.dispose();
    super.dispose();
  }
}
