import 'package:flutter/material.dart';
import 'package:project_02_diamond/screens/home_screen.dart';

class TabBarDemo extends StatelessWidget {
  final Widget child;

  const TabBarDemo({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 110, 67, 183),
        title: const Row(
          children: [
            Text(
              'DIAMOND SOLUTIONS',
              style: TextStyle(color: Color.fromARGB(255, 173, 245, 239)),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.diamond_outlined,
                size: 24.0,
                color: Color.fromARGB(255, 0, 209, 251),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Página Inicial'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            ListTile(
              title: const Text('1 - Par ou Impar'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/pergunta01');
              },
            ),
            ListTile(
              title: const Text('2 - Verificar Maior'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/pergunta02');
              },
            ),
            ListTile(
              title: const Text('3 - Apto a votar'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/pergunta03');
              },
            ),
            ListTile(
              title: const Text('4 - Reajuste Salarial'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/pergunta04');
              },
            ),
            ListTile(
              title: const Text('5 - Dia da Semana'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/pergunta05');
              },
            ),
            ListTile(
              title: const Text('6 - Mostrar Nº + Loteria'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/pergunta06');
              },
            ),
            ListTile(
              title: const Text('7 - Calcular numeros'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/pergunta07');
              },
            ),
            ListTile(
              title: const Text('8 - Apenas impares'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/pergunta08');
              },
            ),
            ListTile(
              title: const Text('9 - Menores que 30 '),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/pergunta09');
              },
            ),
            ListTile(
              title: const Text('10 - Maiores que 50'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/pergunta10');
              },
            ),
            ListTile(
              title: const Text('11 - Texto invertido'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/pergunta11');
              },
            ),
            ListTile(
              title: const Text('12 - Primeira e ultima Maiúscula'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/pergunta12');
              },
            ),
          ],
        ),
      ),
      body: child,
    );
  }
}
