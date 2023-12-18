import 'package:flutter/material.dart';

class Pergunta08 extends StatefulWidget {
  const Pergunta08({Key? key}) : super(key: key);

  @override
  _Pergunta08State createState() => _Pergunta08State();
}

class _Pergunta08State extends State<Pergunta08> {
  final TextEditingController _numeroController = TextEditingController();
  List<int> numerosImpares = [];

  void mostrarImpares(int numero) {
    setState(() {
      numerosImpares.clear();
      for (int i = 1; i <= numero; i++) {
        if (i % 2 != 0) {
          numerosImpares.add(i);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Numeros impares - 8'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _numeroController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite um número',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int? numero = int.tryParse(_numeroController.text);
                if (numero != null && numero > 0) {
                  return mostrarImpares(numero);
                }

                return setState(() {
                  numerosImpares = [];
                });
              },
              child: const Text('Mostrar Ímpares'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemCount: numerosImpares.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: const Color.fromARGB(255, 181, 201, 218),
                    child: Center(
                      child: Text(
                        '${numerosImpares[index]}',
                        style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 234, 5, 242)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
