import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool switchValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switchValue = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Switch',
        ),
      ),
      body: Center(
        child: Switch(
          value: switchValue,
          onChanged: (value) {
            setState(() {
              switchValue = value;
            });
            //
          },
        ),
      ),
    );
  }
  // -- -- Function -- --

  // _changeSwitch() {
  //   switchValue == value;
  // }
  // -- -- Function END  -- --
}// END
