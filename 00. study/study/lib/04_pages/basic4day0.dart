import 'package:flutter/material.dart';

class Basic4day0 extends StatelessWidget {
  const Basic4day0({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '4 Day',
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
                    '/Basic4day1_SwitchCalc',
                  );
                },
                child: const Text('1_SwitchCalc'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(230, 40),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/Basic4day2_justIncreaseSlideBar',
                  );
                },
                child: const Text('2_just Increase Slide Bar'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(230, 40),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/calcBMI',
                  );
                },
                child: const Text('calcBMI'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(230, 40),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/Basic4day4_swipeImage',
                  );
                },
                child: const Text('4_swipeImage'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
