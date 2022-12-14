import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // appbar 가 입체감?그림자가 없어지고 flat 나옴
        toolbarHeight: 60, // appbar 의 세로 사이즈 크기를 조정 할 수 있음
        title: const Text(
          'App Bar Icon',
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.email,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.alarm,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_outlined,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
            child: GestureDetector(
              onTap: () => print('smile image is clicked'),
              child: Image.asset(
                'images/smile.png',
                width: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
