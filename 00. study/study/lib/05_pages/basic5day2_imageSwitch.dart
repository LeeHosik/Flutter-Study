import 'package:flutter/material.dart';

class basic5day2_imageSwitch extends StatefulWidget {
  const basic5day2_imageSwitch({super.key});

  @override
  State<basic5day2_imageSwitch> createState() => _basic5day2_imageSwitch();
}

class _basic5day2_imageSwitch extends State<basic5day2_imageSwitch> {
  late String _lampStatus;
  late String _lampOnOffStatus;
  late String _lampImage;
  late bool _lampSizeSwitch;
  late bool _lampOnOffSwitch;
  //late double slideSize;
  late double widthSize;
  late double heightSize;
  late int circle360;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _lampImage = 'lamp_on.png';
    _lampStatus = '전구 확대';
    _lampOnOffStatus = '전구 스위치';
    _lampSizeSwitch = false;
    _lampOnOffSwitch = true;
    widthSize = 150;
    heightSize = 300;
    circle360 = 360;
    //Slide
    // slideSize = 150;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Image Change by Switch',
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
                  RotationTransition(
                    turns: AlwaysStoppedAnimation(
                      //${int.parse(widthSize) / int.parse(circle360)} ,
                      //${circle360} / 140
                      widthSize / 360,
                    ),
                    child: Image.asset(
                      'images/$_lampImage',
                      width: widthSize,
                      height: heightSize,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Slider(
                  value: widthSize,
                  min: 40,
                  max: 180,
                  divisions: 180,
                  label: widthSize.round().toString(),
                  onChanged: (double value) => _slidewidth(value),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      _lampStatus,
                    ),
                    Switch(
                      value: _lampSizeSwitch,
                      onChanged: (value) {
                        setState(() {
                          lampZoom();
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          _lampOnOffStatus,
                        ),
                        Switch(
                          value: _lampOnOffSwitch,
                          onChanged: (value) {
                            setState(() {
                              lampOnOff();
                            });
                          },
                        ),
                      ],
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
  // ------------ Function ------------

  lampZoom() {
    if (_lampSizeSwitch == false) {
      widthSize = 300;
      heightSize = 600;
      _lampSizeSwitch = true;
      _lampStatus = '전구축소';
    } else {
      widthSize = 150;
      heightSize = 300;
      _lampSizeSwitch = false;
      _lampStatus = '전구확대';
    }
  } //lampZoom END

  lampOnOff() {
    if (_lampOnOffSwitch == true) {
      _lampOnOffSwitch = false;
      _lampImage = 'lamp_off.png';
    } else {
      _lampImage = 'lamp_on.png';
      _lampOnOffSwitch = true;
    }
  }

  _slidewidth(value) {
    setState(() {
      widthSize = value;
    });
  } //_slideKg END
  // ------------ Function END ------------
} // END
