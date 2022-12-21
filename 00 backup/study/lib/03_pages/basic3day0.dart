import 'package:flutter/material.dart';

class Basic3day0 extends StatelessWidget {
  const Basic3day0({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '3 Day',
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
                    '/Basic3day1_AlertNDialog',
                  );
                },
                child: const Text('1_AlertNDialog'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(230, 40),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/basic3Day2StateFul',
                  );
                },
                child: const Text('2_StateFul'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(230, 40),
                ),
                onPressed: () {
                  print('basic3day0s elevatedButton Floating Button Clicked ');
                  Navigator.pushNamed(
                    context,
                    '/basic3Day3FloatingButton',
                  );
                },
                child: const Text('3_FloatingButton'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(230, 40),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/basic3Day4Calculation',
                  );
                },
                child: const Text('4_Calculation'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(230, 40),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/basic3Day4CalcFinal',
                  );
                },
                child: const Text('5_CalcFinal'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
