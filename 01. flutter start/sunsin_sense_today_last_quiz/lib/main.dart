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
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text(
          'Hero Card SuperRare',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 25, 0, 20),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/sense.jpeg'),
                radius: 50,
              ),
            ),
            const Divider(
              height: 30,
              color: Colors.grey,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  '성용',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  '이순신 장군',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  '전 적',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  '62전 62승',
                  style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.w800,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  children: const [
                    Icon(Icons.check_circle_outline),
                    Icon(Icons.check_circle_outline),
                    Icon(Icons.check_circle_outline),
                    Icon(Icons.check_circle_outline),
                    Icon(Icons.check_circle_outline),
                    Icon(Icons.check_circle_outline),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          '??? 해전',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          '??? 해전',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          '??? 해전',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          '??? 해전',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          '??? 해전',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          '??? 해전',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                'images/buksun.gif',
                width: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Column(
//   children: [Image.asset('images/sense.jpeg')],
// )

// Divider(
//   height: 30,
//   color: Colors.grey,
//   thickness: 0.5,
// ),

// Text('성용'),
// Text('이순신 장군'),
// Text('전적'),
// Text('62전 62승'),
// Icon(Icons.check_circle_outline)
// Te

// Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: Row(
//                     children: const [
//                       Icon(Icons.check_circle_outline),
//                       Text('??? 해전'),
//                     ],
//                   ),
//                 ),Icon(Icons.check_circle_outline),

// Text(
//                   '성용',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               Text(
//                 '이순신 장군',
//                 style: TextStyle(
//                   fontSize: 29,
//                 ),
//               ),
//               Text('전적'),
//               Text('62전 62승'),
