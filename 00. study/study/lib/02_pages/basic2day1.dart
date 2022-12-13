import 'package:flutter/material.dart';

class Basic2day0_button extends StatelessWidget {
  const Basic2day0_button({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Basic Start',
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Text('Buttons~'),
            ],
          ),
        ),
      ),
    );
  }
}
