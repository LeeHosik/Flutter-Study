import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController num1;
  late TextEditingController num2;
  late TextEditingController add;
  late TextEditingController sub;
  late TextEditingController mul;
  late TextEditingController div;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    num1 = TextEditingController();
    num2 = TextEditingController();
    add = TextEditingController();
    sub = TextEditingController();
    mul = TextEditingController();
    div = TextEditingController();
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  TextField(
                    controller: num1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text(
                        'Input First Number',
                      ),
                    ),
                  ),
                  TextField(
                    controller: num2,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text(
                        'Input Second Number',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => Calc(context, num1, num2),
                        child: const Text(
                          'Calculation!',
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () => Reset(),
                        child: const Text(
                          'Reset!',
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    controller: add,
                    readOnly: true,
                    decoration: const InputDecoration(
                      label: Text('Result Addition'),
                    ),
                  ),
                  TextField(
                    controller: sub,
                    readOnly: true,
                    decoration: const InputDecoration(
                      label: Text('Result Subtraction'),
                    ),
                  ),
                  TextField(
                    controller: mul,
                    readOnly: true,
                    decoration: const InputDecoration(
                      label: Text('Result Multiplication'),
                    ),
                  ),
                  TextField(
                    controller: div,
                    readOnly: true,
                    decoration: const InputDecoration(
                      label: Text('Result Division'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // -------- Function

  Reset() {
    num1.text = "";
    num2.text = "";
    add.text = "";
    sub.text = "";
    mul.text = "";
    div.text = "";
  } // Reset END

  Calc(BuildContext context, num1, num2) {
    if (num1.text.trim().isEmpty || num2.text.trim().isEmpty) {
      errorSnackBar(context);
    } else {
      // 계산
      Calculation(context, num1, num2);
    }
  } //Calc END

  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          '숫자를 확인해 주세요 ',
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  } // errorSnackBar 뚱

  Calculation(context, num1, num2) {
    int Cadd = int.parse(num1.text) + int.parse(num2.text);
    add.text = '$Cadd';
    int Csub = int.parse(num1.text) - int.parse(num2.text);
    sub.text = '$Csub';
    int Cmul = int.parse(num1.text) * int.parse(num2.text);
    mul.text = '$Cmul';
    if (double.parse(num1.text) == 0 || double.parse(num2.text) == 0) {
      errorSnackBar(context);
    } else {
      double Cdiv = double.parse(num1.text) / double.parse(num2.text);
      div.text = '$Cdiv';
    }
  }
} // END
