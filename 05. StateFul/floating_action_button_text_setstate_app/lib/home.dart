import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        centerTitle: true,
        title: const Text(
          'Floating Action Button',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "현재 클릭 수는 $count 입니다.",
            ),
            const SizedBox(
              height: 30,
            ),
            FloatingActionButton(
              onPressed: () => _Click(),
              backgroundColor: Colors.amber,
              child: const Icon(
                Icons.add,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _Click(),
        backgroundColor: Colors.orange,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

// ----------- Function -----------
  _Click() {
    setState(() {
      count++;
    });
  }
// ----------- Function END -----------

}// END
