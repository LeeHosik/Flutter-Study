import 'package:flutter/material.dart';
import 'package:study/07_pages/basic7day4_lamp_red_on_off_modify.dart';
import 'package:study/07_pages/model/4_RedOnOff_model.dart';

class basic7day4_lamp_red_on_off extends StatelessWidget {
  const basic7day4_lamp_red_on_off({super.key});

  @override
  Widget build(BuildContext context) {
    return Body();
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late bool lampState;
  late bool lampState_red;
  late String imgName;

  @override
  void initState() {
    super.initState();
    lampState = RedOnOff.lamp_onoff;
    lampState_red = RedOnOff.lamp_red;
    imgName = "";
    print('lampState = ${lampState}');
    print('lampState_red = ${lampState_red}');
    if (lampState) {
      if (lampState_red) {
        imgName = 'images/lamp_off.png';
      } else {
        imgName = 'images/lamp_on.png';
      }
    } else {
      imgName = 'images/lamp_off.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Main Screen',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => modify(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imgName,
              width: 250,
            ),
          ],
        ),
      ),
    );
  }

  // ------------ Function ------------
// 2022-12-20 Hosik
  modify() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const basic7day4_lamp_red_on_off_modify(),
      ),
    );
  }
  // ------------ Function END------------

}// END
