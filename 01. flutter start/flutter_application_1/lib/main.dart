import 'package:flutter/material.dart';

void main() {
  // void main 에서 void 없애도 상관없음 1.0 버전때 사용하던 유물
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
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
        title: const Text('This is Flutter'),
        centerTitle: true, // 안드로이드용 센터정렬
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Kitasan Black"),
            SizedBox(
              height: 50,
            ),
            Text("Nisino Flower"),
            Text("Sakura Chiyono O"),
          ],
        ),
      ),
    );
  }
}
