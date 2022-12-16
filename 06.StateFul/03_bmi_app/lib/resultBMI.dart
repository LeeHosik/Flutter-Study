import 'package:flutter/material.dart';

class resultBMI extends StatefulWidget {
  const resultBMI({super.key});

  @override
  State<resultBMI> createState() => _calcBMIState();
}

//class resultBMI(this.result, {Key? Key}) : super (key: key);
class _calcBMIState extends State<resultBMI> {
  //String result = "";
  //(this.result, {Key? Key}) : super (key: key);
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
                'images/nomal.png',
                width: 190,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '귀하의 BMI는 달러 입니다 ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
