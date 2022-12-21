import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:today_01/model/umamusume_model.dart';

class thirdDetail extends StatefulWidget {
  const thirdDetail({super.key});

  @override
  State<thirdDetail> createState() => _thirdDetailState();
}

class _thirdDetailState extends State<thirdDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail View',
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'images/trapcard.jpeg',
                //  'images/${staticMessage.imgPath}.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
