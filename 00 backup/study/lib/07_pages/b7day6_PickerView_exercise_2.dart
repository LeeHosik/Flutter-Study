import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study/07_pages/widget/datepicker.dart';

class b7day6_PickerView_exercise_2 extends StatelessWidget {
  const b7day6_PickerView_exercise_2({super.key});

  @override
  Widget build(BuildContext context) {
    return body();
  }
}

class body extends StatefulWidget {
  const body({super.key});

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add View',
        ),
      ),
      body: Center(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 300,
                height: 450,
                child: CuDatePicker(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
