import 'package:flutter/material.dart';
import 'package:study/06_pages/model/list_view_model.dart';

class basic6day1 extends StatefulWidget {
  const basic6day1({super.key});

  @override
  State<basic6day1> createState() => _basic6day1State();
}

class _basic6day1State extends State<basic6day1> {
  late List<list_view_model> umamusume;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    umamusume = [];
    umamusume.add(list_view_model(
        imgPath: 'images/Daiwa Scarlet.png',
        imgName: 'Daiwa Scarlet',
        Category: '逃げ, 先行'));
    umamusume.add(list_view_model(
        imgPath: 'images/Kitasan Black.png',
        imgName: 'Kitasan Black',
        Category: '逃げ'));
    umamusume.add(list_view_model(
        imgPath: 'images/Mayano Top Gun.png',
        imgName: 'Mayano Top Gun',
        Category: '逃げ, 先行'));
    umamusume.add(list_view_model(
        imgPath: 'images/Mejiro Ardan.png',
        imgName: 'Mejiro Ardan',
        Category: '先行'));
    umamusume.add(list_view_model(
        imgPath: 'images/Mihono Bourbon.png',
        imgName: 'Mihono Bourbon',
        Category: '逃げ'));
    umamusume.add(list_view_model(
        imgPath: 'images/Yamanin Zephyr.png',
        imgName: 'Yamanin Zephyr',
        Category: '逃げ'));
  } // initSate END

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '06-1',
        ),
      ),
      body: ListView.builder(
        itemCount: umamusume.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Card(
              child: Row(
                children: [
                  Image.asset(
                    umamusume[index].imgPath,
                    height: 140,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    umamusume[index].imgName,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    umamusume[index].Category,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
