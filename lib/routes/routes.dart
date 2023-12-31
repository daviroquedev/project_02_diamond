import 'package:flutter/material.dart';
import 'package:project_02_diamond/components/drawer_task.dart';
import 'package:project_02_diamond/screens/home_screen.dart';
import 'package:project_02_diamond/screens/pergunta_01.dart';
import 'package:project_02_diamond/screens/pergunta_02.dart';
import 'package:project_02_diamond/screens/pergunta_03.dart';
import 'package:project_02_diamond/screens/pergunta_04.dart';
import 'package:project_02_diamond/screens/pergunta_05.dart';
import 'package:project_02_diamond/screens/pergunta_06.dart';
import 'package:project_02_diamond/screens/pergunta_07.dart';
import 'package:project_02_diamond/screens/pergunta_08.dart';
import 'package:project_02_diamond/screens/pergunta_09.dart';
import 'package:project_02_diamond/screens/pergunta_10.dart';
import 'package:project_02_diamond/screens/pergunta_11.dart';
import 'package:project_02_diamond/screens/pergunta_12.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return {
    '/': (context) => const DrawerPaginate(child: TestMap()),
    '/pergunta01': (context) => const DrawerPaginate(child: Pergunta01()),
    '/pergunta02': (context) => const DrawerPaginate(child: Pergunta02()),
    '/pergunta03': (context) => const DrawerPaginate(child: Pergunta03()),
    '/pergunta04': (context) => const DrawerPaginate(child: Pergunta04()),
    '/pergunta05': (context) => const DrawerPaginate(child: Pergunta05()),
    '/pergunta06': (context) => const DrawerPaginate(child: Pergunta06()),
    '/pergunta07': (context) => const DrawerPaginate(child: Pergunta07()),
    '/pergunta08': (context) => const DrawerPaginate(child: Pergunta08()),
    '/pergunta09': (context) => const DrawerPaginate(child: Pergunta09()),
    '/pergunta10': (context) => const DrawerPaginate(child: Pergunta10()),
    '/pergunta11': (context) => const DrawerPaginate(child: Pergunta11()),
    '/pergunta12': (context) => const DrawerPaginate(child: Pergunta12()),
  };
}
