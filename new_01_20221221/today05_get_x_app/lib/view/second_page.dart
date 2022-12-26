import 'package:flutter/material.dart';
import 'package:get/get.dart';

class second_page extends StatelessWidget {
  const second_page({super.key});

  @override
  Widget build(BuildContext context) {
    return second_page_body();
  }
}

class second_page_body extends StatefulWidget {
  const second_page_body({super.key});

  @override
  State<second_page_body> createState() => _second_page_bodyState();
}

class _second_page_bodyState extends State<second_page_body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GET X Second Page',
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'Preview',
            ),
          )
        ],
      )),
    );
  }
}
