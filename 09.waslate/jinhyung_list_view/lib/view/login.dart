import 'package:flutter/material.dart';

import 'package:listview_app/view/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController userIdController;
  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userIdController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image.asset('images/login.png'),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: userIdController,
                    decoration: InputDecoration(labelText: '사용자의 ID를 입력하세요'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: '사용자의 PW를 입력하세요'),
                    obscureText: true,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    ///ㄴㅇㄹㄹㅇ
                    if (userIdController.text.trim().isEmpty ||
                        passwordController.text.trim().isEmpty) {
                      erroSnackBar(context);
                    } else {
                      if (userIdController.text.trim() == 'root' &&
                          passwordController.text.trim() == 'qwer1234') {
                        _showDialog(context, userIdController.text,
                            passwordController.text);
                      } else {
                        sheckSnackBar(context);
                      }
                    }
                  },
                  child: Text("Login"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //================================================

  //------------------------------------------------
  //desc : id와 pw를 입력안했을 경우
  //date : 2022.12.20
  erroSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('사용자 ID와 암호를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  //------------------------------------------------
  _showDialog(context, String userId, String password) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('환영합니다!'),
          content: const Text('신분이 확인 되었습니다.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Home(
                        id: userId,
                        pw: password,
                      );
                    },
                  ),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  sheckSnackBar(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('사용자 ID 또는 암호가 일치하지 않습니다'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}
