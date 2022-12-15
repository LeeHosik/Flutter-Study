import 'package:bmi_app/resultBMI.dart';
import 'package:flutter/material.dart';

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
  int defaultNum = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kg = TextEditingController(text: '$defaultNum');
    cm = TextEditingController(text: '$defaultNum');
    _currentSliderCmValue = 0;
    _currentSliderKgValue = 0;
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
                      onPressed: () => gender(1),
                      child: const Icon(
                        Icons.male,
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    FloatingActionButton(
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
                int result = _FnCalcBMI(int.parse(cm.text), int.parse(kg.text));
                // Navigator.push(
                //   context,
                //   //'/resultBMI',
                //   //materialpageroute(builder:(context)=>const resultBMI())
                //   MaterialPageRoute(
                //     builder: (context) => const resultBMI('$result'),

                //     ///
                //     //      값 넘기는거 하던 중 임
                //     ///     https://fronquarry.tistory.com/12
                //     ///     저 result 값만 다음화면으로 넘겨서
                //     ///     그 값마다 switch case 문으로 보여줄 예정임
                //     ///
                //   ),
                //);
              },
              child: Icon(Icons.next_plan),
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
    int m = cm / 100;
    double result = kg / (m * m);
    return result;
  }

// -------------- Function END --------------

} // END
