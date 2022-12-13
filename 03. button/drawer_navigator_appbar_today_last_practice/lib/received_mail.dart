import 'package:flutter/material.dart';

class ReceviedMail extends StatelessWidget {
  const ReceviedMail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recevied Mail',
        ),
        backgroundColor: Colors.red,
      ),
      body: Row(
        children: const [
          Text(
            '유비에게 받은 메일',
          ),
        ],
      ),
    );
  }
}
