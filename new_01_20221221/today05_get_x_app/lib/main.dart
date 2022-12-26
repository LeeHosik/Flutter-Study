import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:today05_get_x_app/home.dart';
import 'package:today05_get_x_app/view/second_page.dart';
import 'package:today05_get_x_app/view/thrid_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // <<<<<<<***
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: './',
      routes: {
        '/': (context) => const Home(),
      },

      getPages: [
        GetPage(
          name: "/third_page",
          page: () => const thrid_page(),
        ),
      ],
    );
  }
}
