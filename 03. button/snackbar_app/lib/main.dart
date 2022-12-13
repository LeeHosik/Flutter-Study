import 'package:flutter/material.dart';
import 'package:snackbar_app/snackbar.dart';

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
          'Snack Bar',
        ),
      ),
      body: const MySnackBar(),
    );
  }

// -- function

  // snackBarfunction(BuildContext context) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(
  //       content: Text(
  //         'hello~ SnackBar~',
  //       ),
  //       duration: Duration(
  //         seconds: 1,
  //       ),
  //       backgroundColor: Colors.red,
  //     ),
  //   );
  // }//snackBarfunction END
} // END
