import 'package:flutter/material.dart';

class ReceviedMail extends StatelessWidget {
  const ReceviedMail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '받은 편지함',
        ),
        backgroundColor: Colors.red,
      ),
      body: Row(children: [
        Text(
          '유비에게 보낸 메일',
        ),
      ]),
    );
  }
}
