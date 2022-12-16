import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List imageName;
  late int currentImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(Duration(milliseconds: 1), (timer) {
      changeImage();
    });

    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
    currentImage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text(
          'Infinity Roop Image',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                imageName[currentImage],
              ),
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                'images/${imageName[currentImage]}',
                height: 470,
                //width: 350,
                //fit: BoxFit.fill, // 꽉채우는거
                // fit:BoxFit.contain // 비율 맞춰서 만드는거
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     ElevatedButton(
              //       onPressed: () {
              //         //
              //       },
              //       child: const Text(
              //         '<< Pre',
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 40,
              //     ),
              //     ElevatedButton(
              //       onPressed: () {
              //         //
              //       },
              //       child: const Text(
              //         'Next >>',
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // --------------------- Function ---------------------

  changeImage() {
    setState(() {
      currentImage++;
      if (currentImage >= imageName.length) {
        currentImage = 0;
      }
    });
  }

  // --------------------- Function END ---------------------
}// 뚱
