import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Color buttonColors;
  late bool bools;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonColors = Colors.red;
    bools = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Changed Button color on Switch',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (() {
                _onClick();
              }),
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColors,
              ),
              child: const Text(
                'Flutter',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Switch(
                value: bools,
                onChanged: ((value) {
                  _onClick();
                }))
          ],
        ),
      ),
    );
  }

// // ------ Function ------
  _onClick() {
    setState(() {
      if (buttonColors == Colors.blue) {
        buttonColors = Colors.red;
        bools = true;
      } else {
        buttonColors = Colors.blue;
        bools = false;
      }
    });
  } //_onClickEND

// ------ Function End ------

} //ENd
    