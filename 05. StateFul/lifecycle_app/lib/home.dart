import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Property
  late String _buttonState;

  @override
  void initState() {
    // 초기값을 잡아주는 녀석
    // TODO: implement initState
    super.initState();
    _buttonState = 'OFF';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Life Cycle',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _onClick(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              child: const Text(
                'Click this Button',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '버튼 상태 :',
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(_buttonState),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///// ------- Funcion ---------

  _onClick() {
    setState(
      () {
        if (_buttonState == 'OFF') {
          _buttonState = 'ON';
        } else {
          _buttonState = 'OFF';
        } // if end
      },
    ); //setState END
  } //_onClick

  ///// -- function end ----
} // _HomeStateEND
