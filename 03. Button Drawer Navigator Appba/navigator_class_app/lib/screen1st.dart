import 'package:flutter/material.dart';
import 'package:navigator_class_app/main.dart';

class Screen1st extends StatelessWidget {
  const Screen1st({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Screen 1st',
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                '처음 화면으로',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
