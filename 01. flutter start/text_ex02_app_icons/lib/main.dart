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
        primarySwatch: Colors.grey,
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
        title: const Text('Text with Column and Row'),
      ),
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.email_rounded),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.account_balance),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.access_alarm),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("test"),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("test"),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("test"),
              ),
            ],
          ),
        ]),
      ),
    );
  } //build END
} //StatelessWidget END
