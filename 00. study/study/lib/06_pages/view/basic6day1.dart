import 'package:flutter/material.dart';
import 'package:study/06_pages/model/list_view_model.dart';

class basic6day1 extends StatefulWidget {
  const basic6day1({super.key});

  @override
  State<basic6day1> createState() => _basic6day1State();
}

class _basic6day1State extends State<basic6day1> {
  late List<umamusume_model> umamusume;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    umamusume = [];
    umamusume.add(umamusume_model(
        imgPath: 'images/Daiwa Scarlet.png',
        imgName: 'Daiwa Scarlet',
        sakusen: '逃げ, 先行',
        category: '속도기'));
    umamusume.add(umamusume_model(
        imgPath: 'images/Kitasan Black.png',
        imgName: 'Kitasan Black',
        sakusen: '逃げ, 先行',
        category: '속가복합기'));
    umamusume.add(umamusume_model(
        imgPath: 'images/Mayano Top Gun.png',
        imgName: 'Mayano Top Gun',
        sakusen: '逃げ, 先行',
        category: '속도기'));
    umamusume.add(umamusume_model(
        imgPath: 'images/Mejiro Ardan.png',
        imgName: 'Mejiro Ardan',
        sakusen: '先行',
        category: '속도기'));
    umamusume.add(umamusume_model(
        imgPath: 'images/Mihono Bourbon.png',
        imgName: 'Mihono Bourbon',
        sakusen: '逃げ',
        category: '속도기'));
    umamusume.add(umamusume_model(
        imgPath: 'images/Yamanin Zephyr.png',
        imgName: 'Yamanin Zephyr',
        sakusen: '先行',
        category: '속도기'));
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
                    umamusume[index].category,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    umamusume[index].sakusen,
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
