import 'package:flutter/material.dart';
import 'package:list_view_with_animal_img_app_exercise/view/home.dart';

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
        '/': (context) => Home(),
      },
    );
  }
}
