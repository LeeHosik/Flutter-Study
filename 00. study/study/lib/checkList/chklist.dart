import 'package:flutter/material.dart';

class chkList extends StatelessWidget {
  const chkList({super.key});

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
                child: const Text('basic7day1_login_nav_tab'),
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
                child: const Text('basic7day2_toast'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
