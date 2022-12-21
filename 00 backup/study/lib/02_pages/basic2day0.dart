import 'package:flutter/material.dart';

class Basic2day0 extends StatelessWidget {
  const Basic2day0({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '2 Day',
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
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/Basic2day0_button',
                  );
                },
                child: const Text('Buttons'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
