import 'package:flutter/material.dart';

class HOme extends StatefulWidget {
  const HOme({super.key});

  @override
  State<HOme> createState() => _HOmeState();
}

class _HOmeState extends State<HOme> {
  late TextEditingController number1Controller;
  late TextEditingController number2Controller;
  late double ResultNumber;
  late String Result;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    number1Controller = TextEditingController();
    number2Controller = TextEditingController();
    ResultNumber = 0;
    Result = "";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            '덧셈 구하기!',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: number1Controller,
                decoration: const InputDecoration(
                  labelText: 'Input First Number',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: number2Controller,
                decoration: const InputDecoration(
                  labelText: 'Input Second Number',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () =>
                    Calc(context, number1Controller, number2Controller),
                child: const Text(
                  '계산하기!',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                Result,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
// -------- Function --------

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

      Result = '입력하신 숫자의 합은 $ResultNumber 입니다.';
    });
  } //CalcResult END

// -------- Function END --------

}// END
