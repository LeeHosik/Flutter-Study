import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvartaTest();
  }
}

class CircleAvartaTest extends StatefulWidget {
  const CircleAvartaTest({super.key});

  @override
  State<CircleAvartaTest> createState() => _CircleAvartaTestState();
}

class _CircleAvartaTestState extends State<CircleAvartaTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Test',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CircleAvatar(
              radius: 150.0,
              backgroundImage: NetworkImage(
                  'https://github.com/LeeHosik/Flutter-Study/blob/main/00%20backup/study/images/Yamanin%20Zephyr.png?raw=true'),
              backgroundColor: Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
