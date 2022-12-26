import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late String userId;
  late String userPw;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userId = "";
    userPw = '';
    _initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GET DATA',
        ),
      ),
      body: Center(
          child: Column(
        children: [
          Text('User ID: $userId'),
          Text('User PW: $userPw'),
        ],
      )),
    );
  } // build END

  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = (prefs.getString('DISRESU'))!;
      userPw = (prefs.getString('WPSRESU'))!;
    });
  } //  _initSharedPreferences END
} // END
