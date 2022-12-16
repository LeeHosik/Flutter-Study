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
  late bool addValue;
  late bool subValue;
  late bool mulValue;
  late bool divValue;

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
    addValue = false;
    subValue = false;
    mulValue = false;
    divValue = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Simple Calculation',
        ),
      ),
      body: Center(
        child: Row(
          children: [
            TextField(
              controller: num1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text(
                  'Input Number 1',
                ),
              ),
            ),
            TextField(
              controller: num2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text(
                  'Input Number 1',
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // -
                      },
                      child: const Text(
                        'Clac!',
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _reset();
                      },
                      child: const Text(
                        'Reset',
                      ),
                    ),
                  ],
                ),
                // Column(
                //   children: [
                //     Switch(
                //       value: addValue,
                //       onChanged: (value) {
                //         setState(() {
                //           addValue = value;
                //         });
                //         //
                //       },
                //     ),
                //   ],
                // ),
              ],
            ),
            TextField(
              controller: add,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text(
                  'Input Number 1',
                ),
              ),
            ),
            TextField(
              controller: sub,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text(
                  'Input Number 1',
                ),
              ),
            ),
            TextField(
              controller: mul,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text(
                  'Input Number 1',
                ),
              ),
            ),
            TextField(
              controller: div,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text(
                  'Input Number 1',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// ------------- Function -------------

  _reset() {
    num1.text = "";
    num2.text = "";
    add.text = "";
    sub.text = "";
    mul.text = "";
    div.text = "";
  } // Reset END

  _calc(BuildContext context, num1, num2) {
    if (num1.text.trim().isEmpty || num2.text.trim().isEmpty) {
      _errorSnackBar(context);
    } else {
      // 계산
      _calculation(context, num1, num2);
    }
  } //Calc END

  _errorSnackBar(BuildContext context) {
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

  _calculation(context, num1, num2) {
    add.text = '${int.parse(num1.text) + int.parse(num2.text)}';

    sub.text = '${int.parse(num1.text) - int.parse(num2.text)}';

    mul.text = '${int.parse(num1.text) * int.parse(num2.text)}';
    if (double.parse(num1.text) == 0 || double.parse(num2.text) == 0) {
      _errorSnackBar(context);
    } else {
      div.text = '${double.parse(num1.text) / double.parse(num2.text)}';
    }
  }
// ------------- Function END -------------

}//
