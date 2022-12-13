import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'seoncd_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'First Page',
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text(
            'Go to the scond page',
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SecondPage();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
