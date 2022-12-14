import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {
  const MySnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => snackBarfunction(context),
        child: const Text(
          'SnackBar Button',
        ),
      ),
    );
  }
}

snackBarfunction(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text(
        'hello~ SnackBar~',
      ),
      duration: Duration(
        seconds: 1,
      ),
      backgroundColor: Colors.red,
    ),
  );
}//snackBarfunction END 