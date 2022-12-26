import 'package:database_app/detail.dart';
import 'package:database_app/home.dart';
import 'package:database_app/insert_student.dart';
import 'package:database_app/modify.dart';
import 'package:database_app/test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          name: "/",
          page: () => const Home(),
        ),
        GetPage(
          name: "/Insert",
          page: () => const Insert(),
        ),
        GetPage(
          name: "/Detail",
          page: () => const Detail(),
        ),
        GetPage(
          name: "/Modify",
          page: () => const Modify(),
        ),
      ],
    );
  }
}
