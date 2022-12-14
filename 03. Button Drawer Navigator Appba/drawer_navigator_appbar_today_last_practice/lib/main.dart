import 'package:drawer_navigator_appbar_today_last_practice/home.dart';
import 'package:drawer_navigator_appbar_today_last_practice/received_mail.dart';
import 'package:drawer_navigator_appbar_today_last_practice/send_mail.dart';
import 'package:flutter/material.dart';

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
        '/SendMail': (context) => const SendMail(),
        '/ReceviedMail': (context) => const ReceviedMail(),
      },
    );
  }
}
