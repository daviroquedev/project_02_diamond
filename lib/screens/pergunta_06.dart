import 'dart:math';
import 'package:flutter/material.dart';

class Pergunta06 extends StatefulWidget {
  const Pergunta06({Key? key}) : super(key: key);

  @override
  _Pergunta06State createState() => _Pergunta06State();
}

class _Pergunta06State extends State<Pergunta06> {
  final TextEditingController _numeroController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Set<int> _numerosMarcados = {};

  List<int> _numeros = [];

  String? _validarNumero(String? value) {
    if (value == null || value.isEmpty) {
      return 'Digite um número inteiro positivo';
    }

    if (int.tryParse(value) == null) {
      return 'Insira apenas números inteiros';
    }

    if (int.parse(value) <= 0) {
      return 'Insira um número inteiro positivo';
    }

    return null;
  }

  void _mostrarNumeros() {
    if (_formKey.currentState!.validate()) {
      int? numero = int.tryParse(_numeroController.text);
      if (numero == null || numero <= 0) {
        return setState(() {
          _numeros = [];
        });
      }

      return setState(() {
        _numeros = List<int>.generate(numero, (index) => index + 1);
      });
    }
  }

  void _marcarNumeros(int quantidade) {
    final random = Random();
    final totalNumbers = Set.from(_numeros);
    int? numero = int.tryParse(_numeroController.text);

    setState(() {
      _numerosMarcados.clear();

      if (_numeros.isEmpty || numero! <= 5) {
        return;
      }

      while (_numerosMarcados.length < quantidade) {
        final numeroAleatorio =
            totalNumbers.toList()[random.nextInt(totalNumbers.length)];
        _numerosMarcados.add(numeroAleatorio);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mostrar Números - 6'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                validator: _validarNumero,
                controller: _numeroController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Digite um número inteiro positivo',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _mostrarNumeros,
                child: const Text('Mostrar Números'),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 248, 218, 239),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('LOTERIA'),
                        ElevatedButton(
                          onPressed: () {
                            _marcarNumeros(5);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 205, 116, 246),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            '05',
                            style: TextStyle(fontSize: 26, color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _marcarNumeros(10);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 205, 116, 246),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            '10',
                            style: TextStyle(fontSize: 26, color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _marcarNumeros(15);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 205, 116, 246),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            '15',
                            style: TextStyle(fontSize: 26, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    crossAxisSpacing: 0.5,
                    mainAxisSpacing: 1.0,
                  ),
                  itemCount: _numeros.length,
                  itemBuilder: (BuildContext context, int index) {
                    final isNumeroMarcado =
                        _numerosMarcados.contains(_numeros[index]);

                    return Card(
                      color: isNumeroMarcado ? Colors.blue : Colors.white,
                      child: Center(
                        child: Text(
                          '${_numeros[index]}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
