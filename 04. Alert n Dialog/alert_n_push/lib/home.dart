import 'package:alert_n_push/second_page.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alert and push',
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),
          child: const Text(
            'Move the 2nd page.',
          ),
        ),
      ),
    );
  }
// -------------- function --------------

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      // barrierDismissible: false, // user must tap the button!
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('Alert Title'),
          content: const Text('You Touched Hello World'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/secondPage');
              },
              child: const Text(' Done '),
            ),
          ],
        );
      },
    );
  }
}// END