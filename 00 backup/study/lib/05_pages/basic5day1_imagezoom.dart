import 'package:flutter/material.dart';
import 'package:study/main.dart';

class Basic5day1_image_zoom_lamp extends StatefulWidget {
  const Basic5day1_image_zoom_lamp({super.key});

  @override
  State<Basic5day1_image_zoom_lamp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Basic5day1_image_zoom_lamp> {
  late String _lampImage;
  late double _lampWidth;
  late double _lampHeight;
  late String _buttonName; // Button Title
  late bool _switch;
  late bool _lampSizeStatus; // LampSize Status

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _buttonName = 'Image 확대';
    _switch = true;
    //_lampSizeStatus = false;
    _lampSizeStatus = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Image Zoom',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 300,
                height: 600,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      _lampImage,
                      width: _lampWidth,
                      height: _lampHeight,
                    ),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    clickButton();
                  },
                  child: Text(
                    _buttonName,
                  ),
                ),
                Column(
                  children: [
                    const Text(
                      '전구 스위치',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Switch(
                      value: _switch,
                      onChanged: (value) {
                        decisionOnOff();
                        setState(() {
                          _switch = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

// ---------------- Function ----------------
// 2022-12-16 Hosik

  clickButton() {
    setState(() {
      if (_lampSizeStatus == false) {
        _lampHeight = 600;
        _lampWidth = 300;
        _lampSizeStatus = true;
        _buttonName = 'Image 축소';
      } else {
        _lampHeight = 300;
        _lampWidth = 150;
        _lampSizeStatus = false;
        _buttonName = 'Image 확대';
      }
    });
  } //clickButton END

  decisionOnOff() {
    if (_switch = true) {
      setState(() {
        _lampImage = 'images/lamp_off.png';
        _switch = false;
      });
    } else {
      setState(() {
        _lampImage = 'images/lamp_on.png';
        _switch = true;
      });
    }
  } // decisionOnOff END
}// END
