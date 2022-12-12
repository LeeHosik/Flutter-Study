import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '거북선',
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        //scrollDirection: Axis.horizontal,
        child: Center(
          child: Column(
            //child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/buksun.gif',
                width: 50,
                height: 100,
                fit: BoxFit.contain,
              ),
              Image.asset(
                'images/buksun.gif',
                width: 50,
                height: 100,
                fit: BoxFit.contain,
              ),
              Image.asset(
                'images/buksun.gif',
                width: 50,
                height: 100,
                fit: BoxFit.contain,
              ),

              // Image.asset(
              // 'images/buksun.gif',
            ],
          ),
        ),
      ),
    );
  }
}
