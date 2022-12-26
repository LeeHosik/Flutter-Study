import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences_app/home.dart';
import 'package:shared_preferences_app/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: './',
      getPages: [
        GetPage(
          name: '/',
          page: () => const login(),
        ),
        GetPage(
          name: '/login',
          page: () => const login(),
        ),
      ],
    );
  }
}
