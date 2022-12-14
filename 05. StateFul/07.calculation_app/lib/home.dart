import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController number1Controller;
  late TextEditingController number2Controller;
  late String Result;
  late double ResultNumber;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    number1Controller = TextEditingController();
    number2Controller = TextEditingController();
    Result = "계산결과 ";
    ResultNumber = 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Simple Calculation',
          ),
        ),
        body: 
      );
          );
  }
      
  }


  /// --------- Function ------

  Calc(BuildContext context, number1Controller, number2Controller) {
    if (number1Controller.text.trim().isEmpty ||
        number2Controller.text.trim().isEmpty) {
      errorSnackBar(context);
    } else {
      CalcResult(number1Controller, number2Controller);
    }
  } //Calc END

  errorSnackBar(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          '숫자를 입력해 주세요',
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  } // errorSnackBar 뚱

  CalcResult(number1Controller, number2Controller) {
    setState(() {
      double.parse(number1Controller.text);
      ResultNumber = double.parse(number1Controller.text) +
          double.parse(number2Controller.text);

      Result = '덧셈결과 $ResultNumber 입니다.';
    });
  } //CalcResult END

// -------- Function END --------

}// END
