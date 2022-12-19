import 'package:flutter/material.dart';
import 'package:todo_list_app/view/detail_list.dart';

import 'package:todo_list_app/view/home.dart';
import 'package:todo_list_app/view/insert.dart';

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
        '/DetailList': (context) => const DetailList(),
        '/Insert': (context) => const Insert(),
      },
    );
  }
}
