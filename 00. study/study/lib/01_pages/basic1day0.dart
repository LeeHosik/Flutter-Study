import 'package:flutter/material.dart';

class Basic1day0 extends StatelessWidget {
  const Basic1day0({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '1 Day',
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
                    '/Basic1day1_DartLang',
                  );
                },
                child: const Text('Dart Lang'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
