import 'package:flutter/material.dart';

class CustomDialog {
  static void showModalVoteDialog(
      BuildContext context, bool podeVotar, int? idade) {
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
}
