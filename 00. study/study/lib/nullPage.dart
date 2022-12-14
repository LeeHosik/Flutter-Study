import 'package:flutter/material.dart';

class nullPage extends StatelessWidget {
  const nullPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Null Page',
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/',
            );
          },
          child: const Text('Home'),
        ),
      ),
    );
  }
}
