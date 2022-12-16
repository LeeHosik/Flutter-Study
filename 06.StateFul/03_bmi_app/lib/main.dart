import 'package:flutter/material.dart';

import 'calcBMI.dart';
import 'resultBMI.dart';
import 'home.dart';
import 'test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: './',
      routes: {
        '/': (context) => const Home(),
        '/resultBMI': (context) => const resultBMI(),
        '/calcBMI': (context) => const calcBMI(),
        '/MyWidget': (context) => const MyWidget(),
      },
    );
  }
}
