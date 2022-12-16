import 'dart:async';

import 'package:flutter/material.dart';

class Basic4day5_TimerText extends StatefulWidget {
  const Basic4day5_TimerText({super.key});

  @override
  State<Basic4day5_TimerText> createState() => _HomeState();
}

class _HomeState extends State<Basic4day5_TimerText> {
  @override
  late String str;
  late List strlist;
  late String viewStr;

  void initState() {
    // TODO: implement initState
    super.initState();
    str = "Kitasan Black";
    strlist = str.split('');
    viewStr = "";
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        _roopChangeText();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LED 광고',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(viewStr),
            Text(str),
          ],
        ),
      ),
    );
  }

  // --------------- Function ---------------
  int i = 0;
  _roopChangeText() {
    setState(() {
      viewStr += strlist[i];
      i = i + 1;
      if (viewStr.length > strlist.length) {
        viewStr = strlist[0];
      }
      if (i >= strlist.length) {
        i = 0;
      }
    });
  }

  // --------------- Function END ---------------
}// END
