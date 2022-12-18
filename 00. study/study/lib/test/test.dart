import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class testToggleButtons extends StatefulWidget {
  const testToggleButtons({super.key});

  @override
  State<testToggleButtons> createState() => _MyWidgetState();
}

/*

3가지 버튼중에서 하나를 고르면 표시가 되는 토글형식 버튼인데
그래서 그 선택된 녀석의 정보를 보내려면 어떻게 써먹어야 될지 모르겠음

지금의 나는 못써먹음 나중에도 써먹을 수 있나 이걸 ?


*/

class _MyWidgetState extends State<testToggleButtons> {
  final _isSelected = [true, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Test',
        ),
      ),
      body: Center(
        child: ToggleButtons(
          constraints: const BoxConstraints(
            maxWidth: 400,
          ),
          // BoxConstraints.expand(width: (
          //   constraints.maxWidth - 4) / 3),
          color: Colors.black,
          fillColor: Colors.blue,
          selectedColor: Colors.amber,
          isSelected: _isSelected,
          onPressed: (int index) {
            setState(
              () {
                for (int buttonIndex = 0;
                    buttonIndex < _isSelected.length;
                    buttonIndex++) {
                  if (buttonIndex == index) {
                    _isSelected[buttonIndex] = true;
                    print(_isSelected[buttonIndex]);
                  } else {
                    _isSelected[buttonIndex] = false;
                    print(_isSelected[buttonIndex]);
                  }
                }
                // _buttonsState[index] = !_buttonsState[index];
              },
            );
          },
          children: [
            Wrap(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 2.0),
                  child: Icon(
                    Icons.monetization_on,
                    size: 20,
                  ),
                ),
                const Text('A'),
              ],
            ),
            Wrap(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 2.0),
                  child: Icon(
                    Icons.monetization_on,
                    size: 20,
                  ),
                ),
                const Text('B'),
              ],
            ),
            Wrap(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 2.0),
                  child: Icon(
                    Icons.monetization_on,
                    size: 20,
                  ),
                ),
                const Text('C'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
