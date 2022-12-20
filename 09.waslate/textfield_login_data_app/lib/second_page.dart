import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String id; //꼭 final로 만들어주기
  final String pw;
  const SecondPage({super.key, required this.id, required this.pw});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("${widget.id}님 환영 합니다. ${widget.pw}"),
      ),
      body: const Center(
        child: CircleAvatar(
          backgroundImage: AssetImage("images/bitcoin.jpg"),
          radius: 100,
        ),
      ),
    );
  }
}
