import 'package:flutter/material.dart';

class Pergunta11 extends StatefulWidget {
  const Pergunta11({Key? key}) : super(key: key);

  @override
  _Pergunta11State createState() => _Pergunta11State();
}

class _Pergunta11State extends State<Pergunta11> {
  final TextEditingController _textoController = TextEditingController();
  String textoInvertido = '';

  void inverterTexto(String texto) {
    String textoReverso = '';
    for (int i = texto.length - 1; i >= 0; i--) {
      textoReverso += texto[i];
    }
    setState(() {
      textoInvertido = textoReverso;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inverte texto - 11'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _textoController,
              decoration: const InputDecoration(
                labelText: 'Digite um texto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String texto = _textoController.text;
                inverterTexto(texto);
              },
              child: const Text('Inverter Texto'),
            ),
            const SizedBox(height: 20),
            Text(
              'Texto Invertido: $textoInvertido',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
