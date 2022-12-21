import 'package:flutter/material.dart';

class Basic7day0 extends StatelessWidget {
  const Basic7day0({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '7 Day',
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
                    '/basic7day1_login_nav_tab',
                  );
                },
                child: const Text('1 login nav tab'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(230, 40),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/basic7day2_toast',
                  );
                },
                child: const Text('2 toast'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(230, 40),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/basic7day3_lampModify',
                  );
                },
                child: const Text('3 lampModify'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(230, 40),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/basic7day4_lamp_red_on_off',
                  );
                },
                child: const Text('4 lamp Red On Off'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(230, 40),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/basic7day5_PickerView',
                  );
                },
                child: const Text('5 Picker View'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(230, 40),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/b7day6_PickerView_exercise',
                  );
                },
                child: const Text('6 PickerView Exercise'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
