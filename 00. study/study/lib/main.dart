import 'package:flutter/material.dart';
import 'package:study/01_pages/basic1day0.dart';
import 'package:study/01_pages/basic1day1.dart';

import 'package:study/02_pages/basic2day0.dart';
import 'package:study/02_pages/basic2day1.dart';
import 'package:study/home.dart';
import 'package:study/nullPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: './',
      routes: {
        '/': (context) => const Home(),
        //nullPage
        '/nullPage': (context) => const nullPage(),
        '/Basic1day0': (context) => const Basic1day0(),
        '/Basic1day1_DartLang': (context) => const Basic1day1_DartLang(),
        // 2day
        '/Basic2day0': (context) => const Basic2day0(),
        '/Basic2day0_button': (context) => const Basic2day0_button(),
        // 3day
        '/Basic3day0': (context) => const nullPage(),
        // 4day
        '/Basic4day0': (context) => const nullPage(),
        // 5day
        '/Basic5day0': (context) => const nullPage(),
        // 6day
        '/Basic6day0': (context) => const nullPage(),
        // 7day
        '/Basic7day0': (context) => const nullPage(),
        // 8day
      },
    );
  }
}