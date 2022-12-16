import 'package:flutter/material.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Resulttext = toString('${widget.result}');
    Resulttext = "";
    imgName = "";
    double srt = widget.result;

    if (srt > 35) {
      Resulttext = '초고도 비만';
      imgName = 'extremelyobese.png';
    } else if (srt > 30 && srt < 34.9) {
      Resulttext = '고도 비만';
      imgName = 'obese.png';
    } else if (srt > 25 && srt < 23) {
      Resulttext = '과체중';
      imgName = 'overweight.png';
    } else if (srt > 24.9 && srt < 18.5) {
      Resulttext = '정상';
      imgName = 'nomal.png';
    } else if (srt > 18.5) {
      Resulttext = '저체중';
      imgName = 'underweight.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 92, 238, 97),
        centerTitle: true,
        title: const Text(
          '당신의 비만도는 ?',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'images/$imgName',
                width: 190,
              ),
              const SizedBox(
                height: 20,
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
                        startValue: 0,
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
