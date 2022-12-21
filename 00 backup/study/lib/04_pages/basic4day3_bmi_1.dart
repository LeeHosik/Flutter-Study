import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study/04_pages/bmiModel/message.dart';

import 'basic4day3_bmi_2.dart';

class calcBMI extends StatefulWidget {
  const calcBMI({super.key});

  @override
  State<calcBMI> createState() => _calcBMIState();
}

class _calcBMIState extends State<calcBMI> {
  late TextEditingController kg;
  late TextEditingController cm;
  late double _currentSliderCmValue;
  late double _currentSliderKgValue;
  late double result;
  int defaultNum = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kg = TextEditingController(text: '$defaultNum');
    cm = TextEditingController(text: '$defaultNum');
    _currentSliderCmValue = 0;
    _currentSliderKgValue = 0;
    result = 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Calc BMI',
          ),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  '성별을 선택해 주세요',
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    FloatingActionButton(
                      heroTag: "btn1",
                      onPressed: () => gender(1),
                      child: const Icon(
                        Icons.male,
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    FloatingActionButton(
                      heroTag: "btn2",
                      backgroundColor: Colors.red,
                      onPressed: () => gender(2),
                      child: const Icon(
                        Icons.female,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: cm,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          label: Text(
                            '키(cm)',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (int.parse(cm.text) > 0) {
                          cm.text = (int.parse(cm.text) - 1).toString();
                        }
                      },
                      iconSize: 30,
                      icon: const Icon(
                        Icons.remove_circle_sharp,
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      // child: CupertinoSlider(
                      child: Slider(
                        value: _currentSliderCmValue,
                        max: 230,
                        divisions: 230,
                        label: _currentSliderCmValue.round().toString(),
                        onChanged: (double value) => _slideCm(value),
                      ),
                    ),
                    IconButton(
                      onPressed: () =>
                          cm.text = (int.parse(cm.text) + 1).toString(),
                      iconSize: 30,
                      icon: const Icon(
                        Icons.add_circle_sharp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 150,
                  child: TextField(
                    controller: kg,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text(
                        '몸무게(kg)',
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (int.parse(kg.text) > 0) {
                          kg.text = (int.parse(kg.text) - 1).toString();
                        }
                      },
                      iconSize: 30,
                      icon: const Icon(
                        Icons.remove_circle_sharp,
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: Slider(
                        value: _currentSliderKgValue,
                        max: 150,
                        divisions: 150,
                        label: _currentSliderKgValue.round().toString(),
                        onChanged: (double value) => _slideKg(value),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        kg.text = (int.parse(kg.text) + 1).toString();
                      },
                      iconSize: 30,
                      icon: const Icon(
                        Icons.add_circle_sharp,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Click();
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.next_plan),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '클릭!',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

// -------------- Function --------------
  _slideCm(value) {
    setState(() {
      int newValue = value.toInt();
      _currentSliderCmValue = value;
      cm.text = '$newValue';
    });
  } //_slideCm END

  _slideKg(value) {
    setState(() {
      int newValue = value.toInt();
      _currentSliderKgValue = value;
      kg.text = '$newValue';
    });
  } //_slideKg END

  gender(int n) {
    if (n == 1) {
      // 1 =  남자
    } else {
      // 2 =  여자
    }
  } // gender END

  _FnCalcBMI(cm, kg) {
    double m = cm / 100;
    double calcResult = kg / (m * m);
    return calcResult;
  }

  Click() {
    if (int.parse(cm.text.trim()) <= 0 || int.parse(kg.text.trim()) <= 0) {
      _errorSnackBar(context);
    } else {
      Message.messageCm = int.parse(cm.text);
      Message.messageKg = int.parse(kg.text);
      result = _FnCalcBMI(
        int.parse(cm.text),
        int.parse(kg.text),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => resultBMI(result),
        ),
      );
    }
  } // Click

  _errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Check Input your Kg & Cm',
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  } // errorSnackBar 뚱
// -------------- Function END --------------

} // END
