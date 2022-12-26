import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today01_webview/first_page.dart';
//import 'package:get/route_manager.dart';
// import 'package:today01_webview/home.dart';
// import 'package:today01_webview/second_page.dart';

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
        primarySwatch: Colors.lime,
      ),
      initialRoute: './',
      getPages: [
        // GetPage(
        //   name: "/",
        //   page: () => const Home(),
        // ),
        GetPage(
          name: "/",
          page: () => const First(),
        ),
        // GetPage(
        //   name: "/Second",
        //   page: () => const Second(),
        // )
      ],
    );
  }
}
