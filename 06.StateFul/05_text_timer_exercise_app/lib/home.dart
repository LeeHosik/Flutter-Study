import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      if (viewStr.length >= strlist.length) {
        viewStr = strlist[0];
      }
      if (i >= strlist.length) {
        i = 0;
      }
    });
  }

/*
자르고, 배열에 넣고, 랭스값 구하고, 하나씩 넣어서 보여주고 


*/

  // --------------- Function END ---------------
}// END
