import 'package:flutter/material.dart';

class Screen2nd extends StatelessWidget {
  const Screen2nd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Screen 2nd',
        ),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                '여기는 Screen #2 . 처음 화면으로',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
