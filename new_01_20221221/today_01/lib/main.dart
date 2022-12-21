import 'package:flutter/material.dart';
import 'package:today_01/home.dart';
import 'package:today_01/view/first_list.dart';
import 'package:today_01/view/second_insert.dart';
import 'package:today_01/view/third_detail.dart';

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
        '/firstList': (context) => const firstList(),
        '/secondInsert': (context) => const secondInsert(),
        '/thirdDetail': (context) => const thirdDetail(),
      },
    );
  }
}
