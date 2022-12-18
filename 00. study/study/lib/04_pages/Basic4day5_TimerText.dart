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
  late Timer _timer;
  void initState() {
    // TODO: implement initState
    super.initState();
    str = "Kitasan Black";
    strlist = str.split('');
    viewStr = "";

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        _roopChangeText();
      },
    );
  }

  @override
  void dispose() {
    /// tabbar 할때 이 종료 안해주면 쓰래기 엄청 쌓임
    //_roopChangeText()?.dispose(); // <<<<<<<<
    _timer?.cancel();
    super.dispose();
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
