import 'package:flutter/material.dart';

class basic3Day3FloatingButton extends StatefulWidget {
  const basic3Day3FloatingButton({super.key});

  @override
  State<basic3Day3FloatingButton> createState() => _HomeState();
}

class _HomeState extends State<basic3Day3FloatingButton> {
  late int count;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Count + -',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '현재 클릭수는 $count 입니다.',
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => countUp(),
                  child: const Icon(
                    Icons.add,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                // FloatingActionButton(
                //   onPressed: () => countRemove(),
                //   backgroundColor: Colors.red,
                //   child: const Icon(
                //     Icons.remove,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

// ------- Function -------

  countUp() {
    setState(() {
      count++;
    });
  } //_CountUp END

  countRemove() {
    setState(() {
      count--;
    }); //_CountRemove END
  }
// ------- Function END -------

}// END
