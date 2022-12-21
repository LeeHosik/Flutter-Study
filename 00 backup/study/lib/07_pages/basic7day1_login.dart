import 'package:flutter/material.dart';

import 'package:study/06_pages/view/basic6day2_TabBar.dart';

class basic7day1_login_nav_tab extends StatefulWidget {
  const basic7day1_login_nav_tab({super.key});

  @override
  State<basic7day1_login_nav_tab> createState() =>
      _basic7day1_login_nav_tabState();
}

class _basic7day1_login_nav_tabState extends State<basic7day1_login_nav_tab> {
  late TextEditingController userid;
  late TextEditingController userpw;
  late List<String> userInfoId;
  late List<String> userInfoPw;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userid = TextEditingController();
    userpw = TextEditingController();
    userInfoId = ['root', 'geust', 'test1', 'test2', 'test3', 'test4'];
    userInfoPw = ['1234', 'qwer', 'test1', 'test2', 'test3', 'test4'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Log In',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('images/cart.png'),
              radius: 100,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextField(
                controller: userid,
                autofocus: true,
                decoration: InputDecoration(
                  label: const Text(
                    'Please input your user ID',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextField(
                controller: userpw,
                decoration: InputDecoration(
                  label: const Text(
                    'Please input your user PW',
                  ),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                chktrim();
              },
              child: Text(
                'Log In',
              ),
            ),
          ],
        ),
      ),
    );
  }

// ----------------- Function -----------------

  chktrim() {
    if (userid.text.trim().isEmpty || userpw.text.trim().isEmpty) {
      _errorSnackBar(context);
    } else {
      chkLogin();
    }
  }

  _errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Check One more time',
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  } // errorSnackBar 뚱

  chkLogin() {
    for (int i = 0; i < userInfoId.length; i++) {
      if (userInfoId[i] == userid.text) {
        if (userInfoPw[i] == userpw.text) {
          _showDialog(context);
        } else {
          _showDialogFail(context);
        } // pw chk if
        break;
      } // id chck if

    } // for end
  } // chkLogin END

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      //barrierDismissible: false, // user must tap the button!
      barrierDismissible: true, // user must tap the button!
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('환영 합니다!'),
          content: const Text('로그인 되셨습니다.'),
          actions: [
            TextButton(
              onPressed: () {
                //staticMessage.boolchk = true;

                Navigator.of(ctx).pop();
                setState(() {
                  // Navigator.pushNamed(context, '/basic6day2_TabBar');
                  userid.text = '';
                  userpw.text = '';
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => basic6day2_TabBar(),
                    ),
                  );
                });
              },
              child: const Text(' OK '),
            ),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            //   onPressed: () => Navigator.of(ctx).pop(),
            //   child: const Text(' Cancle '),
            // ),
          ],
        );
      },
    );
  } // _showDialog END

  _showDialogFail(BuildContext context) {
    showDialog(
      context: context,
      //barrierDismissible: false, // user must tap the button!
      barrierDismissible: true, // user must tap the button!
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('로그인 실패'),
          content: const Text('아이디와 비밀번호를 확인해 주세요'),
          actions: [
            TextButton(
              onPressed: () {
                //staticMessage.boolchk = true;
                Navigator.of(ctx).pop();
                //Navigator.of(ctx).pop();
              },
              child: const Text(' OK '),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text(' Cancle '),
            ),
          ],
        );
      },
    );
  } // _showDialog END
// ----------------- Function END-----------------
}// END
