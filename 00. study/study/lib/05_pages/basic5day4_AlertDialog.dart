import 'package:flutter/material.dart';

class basic5day4_AlertDialog extends StatefulWidget {
  const basic5day4_AlertDialog({super.key});

  @override
  State<basic5day4_AlertDialog> createState() => _basic5day4_AlertDialogState();
}

/*

아니 도대체 나는 뭘  만들고 싶어 한거임 ㅋㅋㅋ

1 - 버튼을 클릭했을때 1개의 함수로 실행하고 싶은데
2 - 그 1개의 함수에서 현재 전구가 켜져있는지 꺼져있는지 확인이 되야됨 
3 - 켜져있으면 켜기 버튼을 클릭했을시 켜져있다는 알람을 만듦 
4 - 끄기를 누르면 끄시겠냐고 예/아니오 알람이 나오게 만들어야 됨
5 - 반대 상태껏도 만들어야 댐

이걸 하려고 했는데 나중에 보려니 머리만 아프네 ㅋ


*/
class _basic5day4_AlertDialogState extends State<basic5day4_AlertDialog> {
  late String callImage;
  late String callImageOn;
  late String callImageOff;
  late bool lampState;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callImage = 'images/lamp_on.png';
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
            const SizedBox(
              height: 30,
            ),
            const Text(
              '함수 미완성',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
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
            ),
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
