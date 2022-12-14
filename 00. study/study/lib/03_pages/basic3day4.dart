import 'package:flutter/material.dart';

class basic3Day4Calculation extends StatefulWidget {
  const basic3Day4Calculation({super.key});

  @override
  State<basic3Day4Calculation> createState() => _HomeState();
}

/*
2022-12-15 
Floating button을 2개 사용하면 Hero Error 걸림. 
이유는 모르겠음 따로 만든 프로젝트에서는 잘 돌아감 
*/
class _HomeState extends State<basic3Day4Calculation> {
  late TextEditingController number1Controller;
  late TextEditingController number2Controller;
  late double resultNumber;
  late String result;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    number1Controller = TextEditingController();
    number2Controller = TextEditingController();
    resultNumber = 0;
    result = "";
    print('basic3day4.dart Started');
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
                result,
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
      resultNumber = double.parse(number1Controller.text) +
          double.parse(number2Controller.text);

      result = '입력하신 숫자의 합은 $resultNumber 입니다.';
    });
  } //CalcResult END

// -------- Function END --------

}// END
