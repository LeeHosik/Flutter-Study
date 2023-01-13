import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_login_app/second_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

// WidgetsBindingObserver 상속 받아야한다. State랑 observer를 알아야 고급 개발자가 된다.
class _LoginState extends State<Login> with WidgetsBindingObserver {
  // lifecycle 관리
  late AppLifecycleState _lastLifecycleState;
  late TextEditingController idController;
  late TextEditingController pwController;
  late String snackT;
  late String snackC;

  @override
  void initState() {
    super.initState();
    // Observer를 만들어야한다.
    WidgetsBinding.instance.addObserver(this);
    // 함수하나 만들기 SharedPreference 초기화 <해주기 위해
    _initSharedPreferences();

    idController = TextEditingController();
    pwController = TextEditingController();
    snackC = '';
    snackT = '';
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    switch (state) {
      case AppLifecycleState.detached:
        print('detached');
        break;
      case AppLifecycleState.resumed:
        print('resumed');
        break;
      case AppLifecycleState.inactive:
        print('incative');
        break;
      case AppLifecycleState.paused:
        _disposeSharedPreferences();
        print('paused');
        break;
      // 슈퍼 위에다가 실행해야한다 슈퍼 밑에다가 하면 소용없다.
    }
    _lastLifecycleState = state;
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // snackbar image는 알아서 넣어라.
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                'images/login.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: idController,
                decoration: const InputDecoration(
                  hintText: '사용자 ID',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: pwController,
                decoration: const InputDecoration(
                  hintText: '사용자 PW',
                ),
                // 비번 가리기
                obscureText: true,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  _snackTC();
                  if (idController.text.trim().isNotEmpty &&
                      pwController.text.trim().isNotEmpty) {
                    _showDialog(context);
                  } else {
                    Get.snackbar(
                      snackT,
                      snackC,
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      duration: Duration(seconds: 2),
                    );
                  }
                },
                child: const Text('Log In'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Fuction
  _initSharedPreferences() async {
    // async(어씽크) 사용.
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      idController.text = (prefs.getString('p_userid') ?? "");
      pwController.text = (prefs.getString('p_password') ?? "");
    });

    print(idController.text);
    print(pwController.text);
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('환영 합니다.'),
          content: const Text('신분이 확인 되었습니다.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _saveSharedPreferences();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SecondPage();
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
  } // Dialog

  // Shared 에 저장하기.
  _saveSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('p_userid', idController.text);
    pref.setString("p_password", pwController.text);
  }

  // 저장한것 지우기.
  _disposeSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  // Snackbar 내용
  _snackTC() {
    if (idController.text.trim().isEmpty) {
      snackT = 'ID Check';
      snackC = 'Check Please';
    }
    if (pwController.text.trim().isEmpty) {
      snackT = 'Pw Check';
      snackC = 'Check Please';
    }
    if (idController.text.trim().isEmpty && pwController.text.trim().isEmpty) {
      snackT = 'Id & Pw Check';
      snackC = 'Check Please';
    }
  }
} // END
