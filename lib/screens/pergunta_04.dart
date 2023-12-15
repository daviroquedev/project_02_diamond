import 'package:flutter/material.dart';

class Pergunta04 extends StatelessWidget {
  const Pergunta04({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reajuste Salarial - 4'),
      ),
      body: const ReajusteSalarialScreen(),
    );
  }
}

class ReajusteSalarialScreen extends StatefulWidget {
  const ReajusteSalarialScreen({Key? key}) : super(key: key);

  @override
  _ReajusteSalarialScreenState createState() => _ReajusteSalarialScreenState();
}

class _ReajusteSalarialScreenState extends State<ReajusteSalarialScreen> {
  final TextEditingController salarioController = TextEditingController();
  final TextEditingController percentualController = TextEditingController();
  double novoSalario = 0;

  void calcularReajuste() {
    double salarioAtual = double.tryParse(salarioController.text) ?? 0;
    double percentual = double.tryParse(percentualController.text) ?? 0;

    double aumento = salarioAtual * (percentual / 100);
    setState(() {
      novoSalario = salarioAtual + aumento;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            controller: salarioController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'Salário Atual',
              hintText: 'Valor do seu salário atual',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: percentualController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'Percentual de Reajuste',
              hintText: 'Valor da porcentagem',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: calcularReajuste,
            child: const Text('Calcular Reajuste'),
          ),
          const SizedBox(height: 20),
          Text(
            'Novo Salário: R\$ $novoSalario',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
