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
              title: const Text('Pergunta 01'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/pergunta01');
              },
            ),
            ListTile(
              title: const Text('Pergunta 02'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/pergunta02');
              },
            ),
            ListTile(
              title: const Text('Pergunta 03'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/pergunta03');
              },
            ),
            ListTile(
              title: const Text('Pergunta 04'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/pergunta04');
              },
            ),
            ListTile(
              title: const Text('Pergunta 05'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/pergunta05');
              },
            ),
            ListTile(
              title: const Text('Pergunta 06'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/pergunta06');
              },
            ),
            ListTile(
              title: const Text('Pergunta 07'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/pergunta07');
              },
            ),
            ListTile(
              title: const Text('Pergunta 08'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/pergunta08');
              },
            ),
          ],
        ),
      ),
      body: child,
    );
  }
}
