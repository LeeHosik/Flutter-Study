import 'package:flutter/material.dart';

class Basic3day1_AlertNDialog extends StatelessWidget {
  const Basic3day1_AlertNDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Dialog and Alert with Gesture',
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),
          child: const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              'Click this Text',
            ),
          ),
        ),
      ),
    );
  }
// -------------- function --------------

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap the button!
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('TRAP CARD'),
          content: const Text('YOU JUST ACTIVATED MY TRAP CARD'),
          // content: const Text('YOU JUST ACTIVATED MY TRAP CARD'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text(' Done '),
            ),
          ],
        );
      },
    );
  } // _showDialog END
  // -------------- Function END --------------
}// END
