import 'package:flutter/material.dart';

class Basic2day0_button extends StatelessWidget {
  const Basic2day0_button({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  print(
                    'text button on clicked',
                  );
                },
                onLongPress: () => print(
                  'long text button',
                ),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                child: const Text(
                  'Text Button',
                  style: TextStyle(
                    fontSize: 28,
                    // color: Colors.amber,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print(
                    'ElevatedButton clicked!',
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    // end 20, -값은 없음
                  ),
                ),
                child: const Text(
                  'ElevatedButton',
                ),
              ),
              OutlinedButton(
                onPressed: () => print(
                  'OutLined Button',
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.amber, // 근데 outlinedbutton이라 이건 좀 ..
                  foregroundColor: Colors.red,
                  side: const BorderSide(
                    color: Colors.purple,
                    width: 2.0,
                  ), //테두리
                ),
                child: const Text('Outlined Button'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.home,
                  size: 80,
                  color: Colors.red,
                ),
                label: const Text(
                  'Icons Text Label',
                  // style: TextStyle(
                  //   color: Colors.black,
                  // ),
                ),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.purple,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  print(
                    'ElevatedButton clicked!',
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    // end 20, -값은 없음
                  ),
                ),
                label: const Text(
                  'ElevatedButton',
                ),
                icon: const Icon(
                  Icons.abc,
                  size: 245,
                  color: Colors.pink,
                ),
              ),
              OutlinedButton.icon(
                onPressed: () => print('123'),
                style: OutlinedButton.styleFrom(
                  //backgroundColor: Colors.purple, // 근데 outlinedbutton이라 이건 좀 ..
                  foregroundColor: Colors.blue,
                  minimumSize: const Size(200, 60),
                  side: const BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ), //테두리
                ),
                label: const Text('Outlined Button'),
                icon: const Icon(
                  Icons.airplanemode_on_rounded,
                  color: Colors.black,
                ),
              ),
              IconButton(
                icon: Image.asset('images/kitasan.jpeg'),
                iconSize: 50,
                onPressed: () {},
              ),
              const Text(
                "Icon Button with image.asset",
              ),
              InkWell(
                child: Column(
                  children: [
                    Image.asset('images/kitasan.jpeg', width: 120, height: 120),
                    // onTap: (() {
                    //   //-
                    // }),
/*
InkWell에 child 에서 바로 Image.asset 이랑 onTap 을 넣어야 이미지 클릭시 Function 사용 가능 
*/
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
