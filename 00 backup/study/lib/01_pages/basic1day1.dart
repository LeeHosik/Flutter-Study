import 'package:flutter/material.dart';

class Basic1day1_DartLang extends StatelessWidget {
  const Basic1day1_DartLang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Basic_01_DartLangBasic 01',
        ),
      ),
      body: Center(
        child: Column(
          children: const [
            SizedBox(
              height: 40,
            ),
            Text('print(intNum1 + intNum2);는 덧셈 '),
            Text('print(intNum1 - intNum2);는 뺄셈'),
            Text('print(intNum1 * intNum2);는 곱셈'),
            Text('print(intNum1 / intNum2);는 나눗셈'),
            Text('flutter는 정수를 나눌때 값을 자동으로 Double처리 해준다 '),
            Text('print(intNum1 % intNum2);'),
            Text('나머지 연산 30-20 해서 남은수는 10이라 출력이 10'),
            Text('print(intNum1 ~/ intNum2); //정수만 출력해주는 나머지몫'),
          ],
        ),
      ),
    );
  }
}
