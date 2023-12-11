import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Pergunta03 extends StatefulWidget {
  const Pergunta03({super.key});

  @override
  State<Pergunta03> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Pergunta03> {
  final maskFormatter = MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
  String? anoNascimento;
  int anoAtual = DateTime.now().year;
  bool podeVotar = false;
  int? idade;

  void verificarVotacao() {
    if (anoNascimento != null && anoNascimento!.length == 10) {
      int ano = int.tryParse(anoNascimento!.substring(6)) ?? 0;
      idade = anoAtual - ano;
      podeVotar = idade! >= 16;
    } else {
      podeVotar = false;
      idade = null;
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Elegibilidade para Votação'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              podeVotar
                  ? 'Você PODE votar este ano!'
                  : 'Você NÃO PODE votar este ano.',
            ),
            const SizedBox(height: 10),
            if (idade != null) Text('Sua idade é: $idade anos'),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pergunta 3'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                inputFormatters: [maskFormatter],
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  labelText: 'Data de Nascimento',
                  hintText: 'DD/MM/AAAA',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    anoNascimento = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: verificarVotacao,
                child: const Text('Verificar Elegibilidade'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
