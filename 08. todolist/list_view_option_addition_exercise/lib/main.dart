import 'package:flutter/material.dart';
import 'package:list_view_option_addition_exercise/home.dart';
//import 'package:list_view_option_addition_exercise/insert.dart';
import 'package:list_view_option_addition_exercise/insert2.dart';

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
        primarySwatch: Colors.blue,
      ),
      initialRoute: './',
      routes: {
        '/': (context) => const Home(),
        '/Insert2': (context) => const Insert2(),
      },
    );
  }
}
