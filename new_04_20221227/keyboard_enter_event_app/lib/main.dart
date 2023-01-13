import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController textEditingController;
  late String inputValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController();
    inputValue = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Keyboard Enter Event',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                label: Text(
                  'data',
                ),
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.go,
              onSubmitted: ((value) {
                setState(() {
                  inputValue = textEditingController.text.toString();
                });
              }),
            ),
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(labelText: 'test'),
              keyboardType: TextInputType.text,
            ),
            Text(inputValue),
          ],
        ),
      ),
    );
  }
}
