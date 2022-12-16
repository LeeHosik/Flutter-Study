import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class Basic4day4_swipeImage extends StatefulWidget {
  const Basic4day4_swipeImage({super.key});

  @override
  State<Basic4day4_swipeImage> createState() => _HomeState();
}

class _HomeState extends State<Basic4day4_swipeImage> {
  late List imageName;
  late int currentImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
/*
 버튼 사진 바꾸는 함수에서 문제가 있음 
 해결 아직 안되어 있음
 2022-12-15 17:12
*/
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
          'Images Swipe',
        ),
      ),
      body: SimpleGestureDetector(
        onHorizontalSwipe: _onHorizontalSwipe, // 앤 함수 ()안적어도 됨?ㄴㄴ 적음빨간줄
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  imageName[currentImage],
                ),
                const SizedBox(
                  height: 40,
                ),
                Image.asset(
                  'images/${imageName[currentImage]}',
                  height: 400,
                  //width: 350,
                  //fit: BoxFit.fill, // 꽉채우는거
                  // fit:BoxFit.contain // 비율 맞춰서 만드는거
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _buttonMove(2);
                      },
                      child: const Text(
                        '<< Pre',
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _buttonMove(1);
                      },
                      child: const Text(
                        'Next >>',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --------------------- Function ---------------------
  _onHorizontalSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.right || direction == SwipeDirection.up) {
        currentImage += 1;
        if (currentImage >= imageName.length) {
          currentImage = 0;
        }
      } else {
        currentImage -= 1;
        if (currentImage < 0) {
          currentImage = imageName.length - 1;
        }
      }
    });
  } // _onHorizontalSwipe END

  _buttonMove(n) {
    if (n / 2 == 1) {
      currentImage += 1;
      if (currentImage >= imageName.length) {
        currentImage = 0;
      }
      print(n);
      print(' n=2 $currentImage');
    } else {
      currentImage -= 1;
      if (currentImage < 0) {
        currentImage = imageName.length - 1;
        print(' n=1 $currentImage');
      }
    }
  } //_buttonMove END

  // --------------------- Function END ---------------------
}// 뚱
