import 'package:flutter/material.dart';

class SendMail extends StatelessWidget {
  const SendMail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Send Mail',
        ),
        backgroundColor: Colors.green,
      ),
      body: Row(
        children: const [
          Text(
            '유비에게 보낸 메일',
          ),
        ],
      ),
    );
  }
}
