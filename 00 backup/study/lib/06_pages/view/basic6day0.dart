import 'package:flutter/material.dart';

class Basic6day0 extends StatelessWidget {
  const Basic6day0({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '6 Day',
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
                    '/basic6day1',
                  );
                },
                child: const Text('1_ViewList'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(230, 40),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/basic6day2_TabBar',
                  );
                },
                child: const Text('Img Listview FirstPage'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
