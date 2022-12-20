import 'package:flutter/material.dart';
import 'package:study/07_pages/model/4_RedOnOff_model.dart';

class basic7day4_lamp_red_on_off_modify extends StatelessWidget {
  const basic7day4_lamp_red_on_off_modify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Modify Screen',
        ),
      ),
      body: body(),
    );
  }
}

class body extends StatefulWidget {
  const body({super.key});

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  late bool lamp_OnOff;
  late bool lamp_Color;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lamp_Color = RedOnOff.lamp_red;
    lamp_OnOff = RedOnOff.lamp_onoff;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Red'),
                const SizedBox(
                  width: 10,
                ),
                Switch(
                    value: lamp_Color,
                    onChanged: (value) {
                      setState(() {
                        lamp_Color = value;
                      });
                      RedOnOff.lamp_red = lamp_Color;
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('On Off'),
                const SizedBox(
                  width: 10,
                ),
                Switch(
                    value: lamp_OnOff,
                    onChanged: (value) {
                      setState(() {
                        lamp_OnOff = value;
                      });
                      RedOnOff.lamp_onoff = lamp_OnOff;
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
