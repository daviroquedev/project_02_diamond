import 'package:flutter/material.dart';
import 'dart:math';

class BtnLotery extends StatelessWidget {
  final Set<int> numerosMarcados;
  final Set<int> numeros;
  final Function(int) marcarNumeros;

  const BtnLotery({
    required this.numerosMarcados,
    required this.numeros,
    required this.marcarNumeros,
  });

  void _mostrarErro(BuildContext context, String mensagem) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(mensagem)));
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final random = Random();
        final numerosNaoMarcados = numeros.toSet().difference(numerosMarcados);
        if (numerosNaoMarcados.length < 10) {
          _mostrarErro(context, 'Não há números suficientes para marcar');
          return;
        }

        while (numerosMarcados.length < 10) {
          final numeroAleatorio = numerosNaoMarcados
              .toList()[random.nextInt(numerosNaoMarcados.length)];
          marcarNumeros(numeroAleatorio);
        }
      },
      child: const Text('Marcar 10 Números'),
    );
  }
}
