import 'package:flutter/material.dart';

class TEST_LIst extends StatefulWidget {
  const TEST_LIst({super.key});

  @override
  State<TEST_LIst> createState() => _TEST_LIstState();
}

class _TEST_LIstState extends State<TEST_LIst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TEST LIST',
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
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(230, 40),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/Login',
                  );
                },
                child: const Text('Login'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(230, 40),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/toastTest',
                  );
                },
                child: const Text('toastTest'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
