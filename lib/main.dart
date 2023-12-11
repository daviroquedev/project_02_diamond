import 'package:flutter/material.dart';
import 'package:project_02_diamond/components/navigation_bar.dart';
import 'package:project_02_diamond/screens/home_screen.dart';
import 'package:project_02_diamond/screens/pergunta_01.dart';
import 'package:project_02_diamond/screens/pergunta_02.dart';
import 'package:project_02_diamond/screens/pergunta_03.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const TabBarDemo(child: HomePage()),
        '/pergunta01': (context) => const TabBarDemo(child: Pergunta01()),
        '/pergunta02': (context) => const TabBarDemo(child: Pergunta02()),
        '/pergunta03': (context) => const TabBarDemo(child: Pergunta03()),
        '/pergunta04': (context) => const TabBarDemo(child: Pergunta03()),
        '/pergunta05': (context) => const TabBarDemo(child: Pergunta03()),
        // Adicione mais rotas conforme necessário
      },
    );
  }
}