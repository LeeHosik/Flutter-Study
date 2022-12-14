import 'package:flutter/material.dart';

class basic3Day2StateFul extends StatefulWidget {
  const basic3Day2StateFul({super.key});

  @override
  State<basic3Day2StateFul> createState() => _HomeState();
}

class _HomeState extends State<basic3Day2StateFul> {
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
      if (bools == false) {
        buttonColors = Colors.blue;
        bools = true;
      } else {
        buttonColors = Colors.red;
        bools = false;
      }
    });
  } //_onClickEND

// ------ Function End ------

} //ENd
    