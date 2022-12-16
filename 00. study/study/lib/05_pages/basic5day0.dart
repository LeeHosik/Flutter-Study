import 'package:flutter/material.dart';

class Basic5day0 extends StatelessWidget {
  const Basic5day0({super.key});

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
                    '/Basic5day1_image_zoom_lamp',
                  );
                },
                child: const Text('1_Image Zoom Lamp'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(230, 40),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/basic5day2_imageSwitch',
                  );
                },
                child: const Text('2_imageSwitch'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(230, 40),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/basic5day3_imageSwitch3',
                  );
                },
                child: const Text('3_imageSwitch3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
