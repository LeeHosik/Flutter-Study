import 'package:flutter/material.dart';
import 'package:study/04_pages/bmiModel/message.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class resultBMI extends StatefulWidget {
  const resultBMI(this.result);
  final double result;

  //const resultBMI(double result, {super.key, required this.result});

  @override
  State<resultBMI> createState() => _calcBMIState();
}

class _calcBMIState extends State<resultBMI> {
  late String Resulttext;
  late String imgName;
  late Color bgColors;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Resulttext = toString('${widget.result}');
    Resulttext = "";
    imgName = "";
    double srt = widget.result;
    print(srt);
    if (srt >= 35) {
      Resulttext = '초고도 비만';
      imgName = 'extremelyobese.png';
      bgColors = Colors.red;
    } else if (srt >= 30 && srt < 35) {
      Resulttext = '고도 비만';
      imgName = 'obese.png';
      bgColors = Colors.orange;
    } else if (srt > 25 && srt < 30) {
      Resulttext = '과체중';
      imgName = 'overweight.png';
      bgColors = Colors.yellow;
    } else if (srt >= 18.5 && srt < 25) {
      Resulttext = '정상';
      imgName = 'nomal.png';
      bgColors = Colors.green;
    } else if (srt < 18.5) {
      Resulttext = '저체중';
      imgName = 'underweight.png';
      bgColors = Colors.blue;
    } else {
      bgColors = Colors.cyan;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColors,
        centerTitle: true,
        title: const Text(
          '당신의 비만도는 ?',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                'images/$imgName',
                //width: 190,
                height: 450,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '입력하신 키는 ${Message.messageCm}cm 이고 몸무게는 ${Message.messageKg}kg 입니다.',
              ),
              Text(
                '귀하의 BMI는 ${widget.result.toStringAsFixed(2)} 이고 ',
              ),
              Text('${Resulttext} 입니다'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SfLinearGauge(
                    minimum: 10,
                    maximum: 40,
                    useRangeColorForAxis: true,
                    ranges: [
                      LinearGaugeRange(
                        color: Colors.purple,
                        startValue: 10,
                        endValue: widget.result,
                      ),
                    ],

                    markerPointers: [
                      LinearShapePointer(
                        value: widget.result,
                      ),
                    ],
                    barPointers: const [
                      LinearBarPointer(
                        value: 100,
                        color: Colors.red,
                      ),
                      LinearBarPointer(
                        value: 35,
                        color: Colors.orange,
                      ),
                      LinearBarPointer(
                        value: 30,
                        color: Colors.yellow,
                      ),
                      LinearBarPointer(
                        value: 25,
                        color: Color.fromARGB(255, 0, 115, 4),
                      ),
                      LinearBarPointer(
                        value: 18.5,
                        color: Colors.cyan,
                      ),
                    ],

                    //useRangeColorForAxis: true,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // ------------ Function ------------
  //horizontal orientaion

  // ------------ Function END ------------

} // END
