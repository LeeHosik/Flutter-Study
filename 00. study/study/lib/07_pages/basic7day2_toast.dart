import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class basic7day2_toast extends StatefulWidget {
  const basic7day2_toast({super.key});

  @override
  State<basic7day2_toast> createState() => _basic7day2_toastState();
}

class _basic7day2_toastState extends State<basic7day2_toast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Toast Message',
        ),
      ),
      body: MyToast(),
    );
  }
}

class MyToast extends StatelessWidget {
  const MyToast({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => flutterToast(),
            child: const Text('Toast Button'),
          ),
          ElevatedButton(
            onPressed: () => test(),
            child: const Text('Toast Button test2'),
          ),
        ],
      ),
    );
  }
}

//
test() {
  Fluttertoast.showToast(msg: 'asdf');
}

//
flutterToast() {
  Fluttertoast.showToast(
    msg: 'Toast BUtton is Clicked',
    gravity: ToastGravity.BOTTOM,
    fontSize: 20,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: Colors.red,
    textColor: Colors.white,
  );
}
