import 'package:flutter/material.dart';

class basic5day3_imageSwitch3 extends StatefulWidget {
  const basic5day3_imageSwitch3({super.key});

  @override
  State<basic5day3_imageSwitch3> createState() =>
      _basic5day3_imageSwitch3State();
}

class _basic5day3_imageSwitch3State extends State<basic5day3_imageSwitch3> {
  late String _lampState;
  late String _lampImage;
  late double imageWidth;
  late double imageHeight;

  //asdfasdf
  //late int allstate;

  //Bool
  late bool imageSize;
  late bool imageOnOff;
  late bool imageColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _lampImage = 'lamp_on.png';
    _lampState = '전구 확대';
    imageWidth = 150;
    imageHeight = 300;
    imageSize = false;
    imageOnOff = true;
    imageColor = false;
    //adsfasdfa
    //allstate = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Image Switch 3',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 600,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/$_lampImage',
                        width: imageWidth,
                        height: imageHeight,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      '전구 색깔',
                    ),
                    Switch(
                      value: imageColor,
                      onChanged: ((value) {
                        imageColorChange();
                      }),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      _lampState,
                    ),
                    Switch(
                      value: imageSize,
                      onChanged: ((value) {
                        setState(() {
                          imageSizeChange();
                        });
                      }),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      '전구 스위치',
                    ),
                    Switch(
                      value: imageOnOff,
                      onChanged: ((value) {
                        imageOnOffFn();
                      }),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // ---------------- Function ----------------
  // 2022-12-16 Hosik

  imageSizeChange() {
    if (imageSize == false) {
      setState(() {
        imageWidth = 300;
        imageHeight = 600;
        imageSize = true;
        _lampState = '전구 확대';
      });
    } else {
      setState(() {
        imageWidth = 150;
        imageHeight = 300;
        imageSize = false;
        _lampState = '전구 축소';
      });
    }
  } // imageSizeChange END

  imageOnOffFn() {
    setState(() {
      if (imageOnOff == true) {
        imageOnOff = false;
        _lampImage = 'lamp_off.png';
      } else {
        imageOnOff = true;
        if (imageColor == false) {
          _lampImage = 'lamp_on.png';
        } else {
          _lampImage = 'lamp_red.png';
        }
      }
    });
  } //imageOnOffFn

  imageColorChange() {
    setState(() {
      if (imageColor == false) {
        _lampImage = 'lamp_red.png';
        imageColor = true;
      } else {
        _lampImage = 'lamp_on.png';
        imageColor = false;
      }
    });
  } //imageColorChange END

  // ---------------- Function END ----------------

}// END
