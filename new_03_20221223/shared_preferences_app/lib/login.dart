import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_app/second_page.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginBody();
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

// Observer
class _LoginBodyState extends State<LoginBody> with WidgetsBindingObserver {
  late AppLifecycleState _lastLifeCycleState;
  late TextEditingController userIdController;
  late TextEditingController userPwController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    userIdController = TextEditingController();
    userPwController = TextEditingController();
    _initSharedPreferences(); // SharedPreference 초기화
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   WidgetsBinding.instance.addObserver(this);
  //   super.dispose();
  // }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    switch (state) {
      case AppLifecycleState.detached:
        _disposeSharedPreferences();
        print('detached');
        break;
      case AppLifecycleState.resumed:
        print('resumed');
        break;
      case AppLifecycleState.inactive:
        print('inactive');
        break;
      case AppLifecycleState.paused:
        print('paused');
        break;
    }
    setState(() {
      _lastLifeCycleState = state;
    });
    // super 위에 적어야 함
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: userIdController,
              decoration: const InputDecoration(
                label: Text('Input user ID'),
              ),
            ),
            TextField(
              controller: userPwController,
              decoration: InputDecoration(
                hintText: 'input Password',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _showDialog(context);
              },
              child: const Text(
                'Log In',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------------ Function ------------------------
  // 2022-12-23 Hosik
  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userIdController.text = (prefs.getString('DISRESU') ?? "");
      userPwController.text = (prefs.getString('WPSRESU') ?? "");
    });

    print(userIdController.text);
    print(userPwController.text);
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('hello'),
            content: const Text('check your account'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _saveSharedPrefereces();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SecondPage();
                      },
                    ),
                  );
                },
                child: const Text(
                  'OK',
                ),
              ),
            ],
          );
        });
  } //_showDialog END

  _saveSharedPrefereces() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('DISRESU', userIdController.text);
    pref.setString('WPSRESU', userIdController.text);
  } // _saveSharedPrefereces END

  _disposeSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  } // _disposeSharedPreferences END

  // ------------------------ Function END ------------------------
} // END
