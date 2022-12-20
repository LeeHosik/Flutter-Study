import 'package:flutter/material.dart';
import 'package:study/01_pages/basic1day0.dart';
import 'package:study/01_pages/basic1day1.dart';

import 'package:study/02_pages/basic2day0.dart';
import 'package:study/02_pages/basic2day1.dart';
import 'package:study/05_pages/basic5day0.dart';
import 'package:study/05_pages/view/final_insert.dart';
import 'package:study/05_pages/view/final_list.dart';
import 'package:study/06_pages/view/basic6day1.dart';
import 'package:study/06_pages/view/basic6day2_TabBar.dart';
import 'package:study/06_pages/view/basic6day2_img_listview_firstPage.dart';
import 'package:study/06_pages/view/basic6day2_img_listview_secondPage.dart';

import 'package:study/07_pages/basic7day0.dart';
import 'package:study/07_pages/basic7day1_login.dart';
import 'package:study/07_pages/basic7day2_toast.dart';
import 'package:study/07_pages/basic7day3_lampModify.dart';
import 'package:study/07_pages/basic7day4_lamp_red_on_off.dart';
import 'package:study/07_pages/basic7day5_PickerView.dart';
import 'package:study/07_pages/toastClicke.dart';
import 'package:study/checkList/chklist.dart';
import 'package:study/home.dart';
import 'package:study/nullPage.dart';
import 'package:study/test/test.dart';
import 'package:study/test/testList.dart';

import '03_pages/basic3day0.dart';
import '03_pages/basic3day1.dart';
import '03_pages/basic3day2.dart';
import '03_pages/basic3day3.dart';
import '03_pages/basic3day4.dart';
import '03_pages/basic3day5.dart';
import '04_pages/Basic4day4_swipeImage.dart';
import '04_pages/Basic4day5_TimerText.dart';
import '04_pages/basic4day0.dart';
import '04_pages/basic4day1.dart';
import '04_pages/basic4day2.dart';

import '04_pages/basic4day3_bmi_1.dart';
import '05_pages/basic5day1_imagezoom.dart';
import '05_pages/basic5day2_imageSwitch.dart';
import '05_pages/basic5day3_imageSwitch3.dart';
import '05_pages/basic5day4_AlertDialog.dart';
import '05_pages/basic5day5_tabBar.dart';
import '05_pages/basic5day6_listView.dart';
import '05_pages/basic5day7_Final.dart';
import '06_pages/view/basic6day0.dart';

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
        '/Basic4day5_TimerText': (context) => const Basic4day5_TimerText(),

        // 5day
        '/Basic5day0': (context) => const Basic5day0(),
        '/Basic5day1_image_zoom_lamp': (context) =>
            const Basic5day1_image_zoom_lamp(),
        '/basic5day2_imageSwitch': (context) => const basic5day2_imageSwitch(),

        '/basic5day3_imageSwitch3': (context) =>
            const basic5day3_imageSwitch3(),
        '/basic5day4_AlertDialog': (context) => const basic5day4_AlertDialog(),
        '/basic5day5_tabBar': (context) => const basic5day5_tabBar(),
        '/basic5day6_listView': (context) => const basic5day6_listView(),

        // todoList View
        '/basic5day7_Final': (context) => const basic5day7_Final(),
        '/final_insert': (context) => const final_insert(),
        '/final_list': (context) => final_list(),
        // 6day
        '/Basic6day0': (context) => const Basic6day0(),
        '/basic6day1': (context) => const basic6day1(),
        '/basic6day2_TabBar': (context) => const basic6day2_TabBar(),

        '/basic6day2_img_listview_firstPageInsert': (context) =>
            const basic6day2_img_listview_firstPageInsert(),
        '/basic6day2_img_listview_secondPageList': (context) =>
            const basic6day2_img_listview_secondPageList(),
        // 7day
        '/Basic7day0': (context) => const Basic7day0(),
        '/basic7day1_login_nav_tab': (context) =>
            const basic7day1_login_nav_tab(),
        '/basic7day2_toast': (context) => const basic7day2_toast(),
        '/basic7day3_lampModify': (context) => const basic7day3_lampModify(),
        '/basic7day4_lamp_red_on_off': (context) =>
            const basic7day4_lamp_red_on_off(),
        '/basic7day5_PickerView': (context) => const basic7day5_PickerView(),

        // Test
        '/testToggleButtons': (context) => const testToggleButtons(),
        '/TEST_LIst': (context) => const TEST_LIst(),
        '/toastTest': (context) => const toastTest(),
        // '/Login': (context) => const Login(),

        // Need Check List
        '/chkList': (context) => const chkList(),
      },
    );
  }
}
