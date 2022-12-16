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
  late bool addbool;
  late bool subbool;
  late bool mulbool;
  late bool divbool;

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
    addbool = false;
    subbool = false;
    mulbool = false;
    divbool = false;
  } //initState END

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Simple Calculation',
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Column(
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
                        'Input Number 2',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => _calc(context, num1, num2),
                        child: const Text(
                          'Calculation',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () => _reset(),
                        child: const Text(
                          'Reset',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Add',
                      ),
                      Switch(
                        value: addbool,
                        onChanged: (value) => _addSwitch(value),
                      ),
                      const Text(
                        'Sub',
                      ),
                      Switch(
                        value: subbool,
                        onChanged: (value) => _subSwitch(value),
                      ),
                      const Text(
                        'Mul',
                      ),
                      Switch(
                        value: mulbool,
                        onChanged: (value) => _mulSwitch(value),
                      ),
                      const Text(
                        'Div',
                      ),
                      Switch(
                        value: divbool,
                        onChanged: (value) => _divSwitch(value),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TextField(
                        controller: add,
                        readOnly: true,
                        decoration: const InputDecoration(
                          label: Text(
                            'Result Addition',
                          ),
                        ),
                      ),
                      TextField(
                        controller: sub,
                        readOnly: true,
                        decoration: const InputDecoration(
                          label: Text(
                            'Result Subtraction',
                          ),
                        ),
                      ),
                      TextField(
                        controller: mul,
                        readOnly: true,
                        decoration: const InputDecoration(
                          label: Text(
                            'Result Multiplication',
                          ),
                        ),
                      ),
                      TextField(
                        controller: div,
                        readOnly: true,
                        decoration: const InputDecoration(
                          label: Text(
                            'Result Division',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ----------------- Function -----------------
  _reset() {
    setState(() {
      addbool = false;
      subbool = false;
      mulbool = false;
      divbool = false;
    });
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
      setState(() {
        addbool = true;
        subbool = true;
        mulbool = true;
        divbool = true;
      });
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
    _calcAdd();
    _calcSub();
    _calcMul();
    _calcDiv();
  } // _calculation END

// Switch
  _addSwitch(value) {
    setState(() {
      addbool = value;
      if (addbool == false) {
        add.text = "";
      } else {
        _calcAdd();
      }
    });
  }

  _subSwitch(value) {
    setState(() {
      subbool = value;
      if (subbool == false) {
        sub.text = "";
      } else {
        _calcSub();
      }
    });
  }

  _mulSwitch(value) {
    setState(() {
      mulbool = value;
      if (mulbool == false) {
        mul.text = "";
      } else {
        _calcMul();
      }
    });
  }

  _divSwitch(value) {
    setState(() {
      divbool = value;
      if (divbool == false) {
        div.text = "";
      } else {
        _calcDiv();
      }
    });
  } //_divswitch

// 4칙연산
  _calcAdd() {
    add.text = '${int.parse(num1.text) + int.parse(num2.text)}';
  }

  _calcSub() {
    sub.text = '${int.parse(num1.text) - int.parse(num2.text)}';
  }

  _calcMul() {
    mul.text = '${int.parse(num1.text) * int.parse(num2.text)}';
  }

  _calcDiv() {
    if (double.parse(num1.text) == 0 || double.parse(num2.text) == 0) {
      _errorSnackBar(context);
    } else {
      div.text = '${double.parse(num1.text) / double.parse(num2.text)}';
    }
  } // _calcDiv 뚱
  // ----------------- Function END -----------------
} //END
