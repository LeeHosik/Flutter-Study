import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
              'Hello World',
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
          title: const Text('Alert Title'),
          content: const Text('You Touched Hello World'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text(' Done '),
            ),
          ],
        );
      },
    );
  }
}// END
