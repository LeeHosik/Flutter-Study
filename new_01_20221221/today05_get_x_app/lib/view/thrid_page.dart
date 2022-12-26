import 'package:flutter/material.dart';
import 'package:get/get.dart';

class thrid_page extends StatelessWidget {
  const thrid_page({super.key});

  @override
  Widget build(BuildContext context) {
    return thrid_page_body();
  }
}

class thrid_page_body extends StatefulWidget {
  const thrid_page_body({super.key});

  @override
  State<thrid_page_body> createState() => _thrid_page_bodyState();
}

class _thrid_page_bodyState extends State<thrid_page_body> {
  late var id;
  late var name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = Get.parameters[id] ?? '_';
    name = Get.parameters[name] ?? '_';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GET X Third Page',
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(id),
          Text(name),
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
