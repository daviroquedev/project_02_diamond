import 'package:flutter/material.dart';

class Pergunta05 extends StatefulWidget {
  const Pergunta05({Key? key}) : super(key: key);

  @override
  _Pergunta05State createState() => _Pergunta05State();
}

class _Pergunta05State extends State<Pergunta05> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dia da Semana'),
      ),
      body: const DiaDaSemanaScreen(),
    );
  }
}

class DiaDaSemanaScreen extends StatefulWidget {
  const DiaDaSemanaScreen({super.key});

  @override
  _DiaDaSemanaScreenState createState() => _DiaDaSemanaScreenState();
}

class _DiaDaSemanaScreenState extends State<DiaDaSemanaScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _numeroController = TextEditingController();
  String? _diaDaSemana;

  void _verificarDiaDaSemana() {
    if (_formKey.currentState!.validate()) {
      int? numero = int.tryParse(_numeroController.text);
      setState(() {
        switch (numero) {
          case 1:
            _diaDaSemana = 'Domingo';
            break;
          case 2:
            _diaDaSemana = 'Segunda-feira';
            break;
          case 3:
            _diaDaSemana = 'Terça-feira';
            break;
          case 4:
            _diaDaSemana = 'Quarta-feira';
            break;
          case 5:
            _diaDaSemana = 'Quinta-feira';
            break;
          case 6:
            _diaDaSemana = 'Sexta-feira';
            break;
          case 7:
            _diaDaSemana = 'Sábado';
            break;
          default:
            _diaDaSemana = 'Número inválido';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Digite um numero de 1 a 7';
                }

                return null;
              },
              controller: _numeroController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite um número de 1 a 7',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verificarDiaDaSemana,
              child: const Text('Verificar Dia da Semana'),
            ),
            const SizedBox(height: 20),
            Text(
              _diaDaSemana ?? '',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
