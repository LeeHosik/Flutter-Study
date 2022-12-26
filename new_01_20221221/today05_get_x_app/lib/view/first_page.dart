import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class first_page extends StatelessWidget {
  const first_page({super.key});

  @override
  Widget build(BuildContext context) {
    return first_page_body();
  }
}

class first_page_body extends StatefulWidget {
  const first_page_body({super.key});

  @override
  State<first_page_body> createState() => _first_page_bodyState();
}

class _first_page_bodyState extends State<first_page_body> {
  var value = Get.arguments ?? "_";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GET X First Page',
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Get.back(result: "Good");
            },
            child: Text(value[0]),
          ),
          Text('${value[1]} 과 ${value[2]}')
        ],
      )),
    );
  }
}
