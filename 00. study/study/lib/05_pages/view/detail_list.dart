import 'package:flutter/material.dart';

import 'package:study/05_pages/model/message.dart';

class Detail_list extends StatefulWidget {
  const Detail_list({super.key});

  @override
  State<Detail_list> createState() => _Detail_listState();
}

class _Detail_listState extends State<Detail_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'data',
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(Message.image123),
              Text(Message.workList),
            ],
          ),
        ),
      ),
    );
  }
}
