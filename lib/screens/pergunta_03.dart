import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:project_02_diamond/components/dialog_vote.dart';

class Pergunta03 extends StatefulWidget {
  const Pergunta03({super.key});

  @override
  State<Pergunta03> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Pergunta03> {
  final maskFormatter = MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? anoNascimento;
  int anoAtual = DateTime.now().year;
  bool podeVotar = false;
  int? idade;

  void verificarVotacao() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (anoNascimento != null && anoNascimento!.length == 10) {
      int ano = int.tryParse(anoNascimento!.substring(6)) ?? 0;
      idade = anoAtual - ano;
      podeVotar = idade! >= 16;

      CustomDialog.showModalVoteDialog(context, podeVotar, idade);
      return;
    }

    podeVotar = false;
    idade = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apto a votar? - 3'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite a data de nascimento';
                    }

                    List<String> dateParts = value.split('/');
                    if (dateParts.length != 3) {
                      return 'Formato inválido. Use DD/MM/AAAA';
                    }

                    int day = int.tryParse(dateParts[0]) ?? 0;
                    int month = int.tryParse(dateParts[1]) ?? 0;
                    int year = int.tryParse(dateParts[2]) ?? 0;

                    if (day < 1 ||
                        day > 31 ||
                        month < 1 ||
                        month > 12 ||
                        year < 1900 ||
                        year > DateTime.now().year) {
                      return 'Data de nascimento inválida, verifique o formato DD/MM/YYYY - 31/12/1900';
                    }

                    return null;
                  },
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
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: verificarVotacao,
                  child: const Text('Verificar Elegibilidade'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
