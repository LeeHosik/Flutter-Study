import 'package:flutter/material.dart';

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
                  '성별을 입력해 주세요',
                ),
                Row(
                  children: [
                    // CircleAvatar(
                    //   backgroundImage: AssetImage('images/female.png'),
                    //   radius: 40,
                    // ),
                    // SizedBox(
                    //   width: 40,
                    // ),
                    // CircleAvatar(
                    //   backgroundImage: AssetImage('images/male.png'),
                    //   radius: 40,
                    // ),
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
                SizedBox(
                  width: 300,
                  child: Slider(
                    value: _currentSliderCmValue,
                    max: 230,
                    divisions: 230,
                    label: _currentSliderCmValue.round().toString(),
                    onChanged: (double value) => _slideCm(value),
                  ),
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
                SizedBox(
                  width: 300,
                  child: Slider(
                    value: _currentSliderKgValue,
                    max: 150,
                    divisions: 150,
                    label: _currentSliderKgValue.round().toString(),
                    onChanged: (double value) => _slideKg(value),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                print('elevataedbutton clicked');
                result = _FnCalcBMI(int.parse(cm.text), int.parse(kg.text));
                print('result = $result');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => resultBMI(result),
                  ),
                );
                print('after navigator psuh');
              },
              child: const Icon(Icons.next_plan),
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

// -------------- Function END --------------

} // END
