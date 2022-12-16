import 'package:flutter/material.dart';

class basic5day4_AlertDialog extends StatefulWidget {
  const basic5day4_AlertDialog({super.key});

  @override
  State<basic5day4_AlertDialog> createState() => _basic5day4_AlertDialogState();
}

class _basic5day4_AlertDialogState extends State<basic5day4_AlertDialog> {
  late String callImage;
  late String callImageOn;
  late String callImageOff;
  late bool lampState;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callImage = '';
    callImageOn = 'images/lamp_on.png';
    callImageOff = 'images/lamp_off.png';
    lampState = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alert를 이용한 메세지 출력 ',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              callImage,
              width: 300,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    buttonBoolChk(context, lampState, true);
                  },
                  child: const Text(
                    '켜기',
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    buttonBoolChk(context, lampState, false);
                  },
                  child: const Text(
                    '끄기',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // ----------- Function -----------

//2022-12-16 Hosik

  buttonBoolChk(context, lampState, boolState) {
    String _onoffState = '';
    String willOnOFf = '';

    if (lampState == boolState) {
      if (lampState == true) {
        _onoffState = '켜진 상태';
      } else {
        _onoffState = '꺼진 상태';
      } //insdie IF

    } else {
      // 전구 상태와 반대되는 버튼을 눌렀을시, 꺼진거면 켜진거, 켜진거면 꺼지는걸 누른거임
      if (lampState == true) {
        willOnOFf = "끄시겠";
        // 알람창 먼저 하나 올라와야됨     callImage = callImageOff;
        //  buttonBoolChk(context, lampState, boolState);
      } else {
        willOnOFf = "켜시겠";
        // 알람창 먼저 하나 올라와야 됨      callImage = callImageOn;

      }
    } //OUT side IF
    //  makeAlertButton();
    buttonBoolChk(
      BuildContext context,
      boolState,
      /*boolState*/
    ) {
      //buttonBoolChk

      makeAlertButton(lampState) {
        TextButton okAndno = TextButton(
          onPressed: () => callImage = callImageOff,
          child: const Text(' 네, 알겠습니다 '),
        );

        TextButton changeLampOk = TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(' 네'),
        );

        TextButton changeLampNo = TextButton(
          onPressed: () => callImage = callImageOff,
          child: const Text(' 아니요 '),
        );
      }
    }

    _showDialog(BuildContext context, boolState) {
      // makeAlertButton();
      showDialog(
        context: context,
        barrierDismissible: false, // user must tap the button!
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('현재 램프가 $_onoffState 입니다'),
            content: Text(
              '현재 램프가 $_onoffState 입니다.',
            ),
            actions: [
              // -- input functiontextbutton
            ],
          );
        },
      );
    }
  } // _showDialog END
  //----------- END -----------
} // END
