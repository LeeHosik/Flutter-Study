import 'package:flutter/material.dart';
import 'package:study/01_pages/basic1day0.dart';
import 'package:study/01_pages/basic1day1.dart';

import 'package:study/02_pages/basic2day0.dart';
import 'package:study/02_pages/basic2day1.dart';
import 'package:study/home.dart';
import 'package:study/nullPage.dart';

import '03_pages/basic3day0.dart';
import '03_pages/basic3day1.dart';
import '03_pages/basic3day2.dart';
import '03_pages/basic3day3.dart';
import '03_pages/basic3day4.dart';
import '03_pages/basic3day5.dart';
import '04_pages/Basic4day4_swipeImage.dart';
import '04_pages/basic4day0.dart';
import '04_pages/basic4day1.dart';
import '04_pages/basic4day2.dart';

import '04_pages/basic4day3_bmi_1.dart';

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
        '/Basic3day0': (context) => const Basic3day0(),
        '/Basic3day1_AlertNDialog': (context) =>
            const Basic3day1_AlertNDialog(),
        '/basic3Day2StateFul': (context) => const basic3Day2StateFul(),
        '/basic3Day3FloatingButton': (context) =>
            const basic3Day3FloatingButton(),
        '/basic3Day4Calculation': (context) => const basic3Day4Calculation(),

        '/basic3Day4CalcFinal': (context) => const basic3Day4CalcFinal(),
        '/Basic4day2_justIncreaseSlideBar': (context) =>
            const Basic4day2_justIncreaseSlideBar(),

        // 4day
        '/Basic4day0': (context) => const Basic4day0(),
        '/Basic4day1_SwitchCalc': (context) => const Basic4day1_SwitchCalc(),
        '/Basic4day2_justIncreaseSlideBar': (context) =>
            const Basic4day2_justIncreaseSlideBar(),
        '/calcBMI': (context) => const calcBMI(),
        '/Basic4day4_swipeImage': (context) => const Basic4day4_swipeImage(),

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
