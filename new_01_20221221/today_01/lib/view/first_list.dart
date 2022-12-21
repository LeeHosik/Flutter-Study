// import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:today_01/model/musumeList.dart';
import 'package:today_01/model/umamusume_model.dart';
import 'package:today_01/view/third_detail.dart';

class firstList extends StatefulWidget {
  const firstList({super.key});

  @override
  State<firstList> createState() => _firstListState();
}

class _firstListState extends State<firstList> {
  late List<umamusume_model> thisumamusumeList;

  @override
  void initState() {
    super.initState();
    thisumamusumeList = [];
    // _pageController = PageController();
    // umamusumeList.add('Aston Machan');
    // umamusumeList.add('Daiwa Scarlet');
    // umamusumeList.add('Grass Wonder');
    // umamusumeList.add('Kitasan Black');
    // umamusumeList.add('Maruzensky');
    // umamusumeList.add('Mayano Top Gun');
    // umamusumeList.add('Mejiro Ardan');
    // umamusumeList.add('Mejiro Bright');
    // umamusumeList.add('Mejiro Dober');
    // umamusumeList.add('Silence Suzuka');
    // umamusumeList.add('Yamanin Zephyr');
    thisumamusumeList = musumeList.umamusume;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'data',
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         Navigator.pushNamed(context, '/Insert');
      //       },
      //       icon: Icon(Icons.add),
      //     ),
      //   ],
      // ),
      body: GridView.builder(
        itemCount: thisumamusumeList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              staticMessage.imgPath = thisumamusumeList[index].imgName;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const thirdDetail(),
                ),
              );
            },
            child: Card(
              color: Colors.white,
              child: Image.asset(
                'images/${thisumamusumeList[index].imgName}.png',
              ),
            ),
          );
        },
      ),
    );
  }
}
