import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today05_get_x_app/view/first_page.dart';
import 'package:today05_get_x_app/view/second_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeBody();
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GET X HOME",
        ),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Navigation'),
            ElevatedButton(
              onPressed: () async {
                //await Get.to(const first_page());

                var returnValue = await Get.to(
                  const first_page(),
                  arguments: ["First TEST", 'Second Test', "Third Test"],
                  transition: Transition.cupertinoDialog,
                  duration: const Duration(seconds: 1),
                );
                Get.snackbar("Return Value", returnValue);
              },
              child: const Text(
                'Move First Page',
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Get.toNamed('/third?id=root&name=루트');
              },
              child: const Text(
                'Move ThirdPage',
              ),
            ),

            // ElevatedButton(
            //   onPressed: () {
            //     Get.toNamed('/second_page');
            //   },
            //   child: const Text(
            //     'Move Second Page',
            //   ),
            // ),
            const Text(
              'SnackBar',
            ),
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  "SnackBar",
                  "message",
                  backgroundColor: Colors.amber,
                  snackPosition: SnackPosition.TOP,
                  duration: const Duration(seconds: 2),
                );
                Get.snackbar(
                  "SnackBar",
                  "message",
                  backgroundColor: Colors.amber,
                  snackPosition: SnackPosition.BOTTOM,
                  duration: const Duration(seconds: 2),
                );
              },
              child: const Text(
                'snackbar',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Dialog'),
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                  title: 'Dialog',
                  middleText: 'Message',
                  actions: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text(
                        'Dialog',
                      ),
                    ),
                  ],
                );
              },
              child: const Text(
                'Dialog',
              ),
            ),
            const Text(
              'Bottom Sheet',
            ),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    height: 100,
                    color: Colors.purple[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Text Line 1',
                        ),
                        Text(
                          'Text Line 2',
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: const Text(
                'Bottom Sheet',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
