import 'package:flutter/material.dart';
import 'package:list_view_with_animal_img_app_exercise/model/animalList.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<AnimalList> ani;
  late String varcategory;
  late String canfly;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ani = [];

    ani.add(
      AnimalList(
        imagePath: 'images/bee.png',
        animalName: '벌',
        animalCategory: 'flybug',
      ),
    );
    ani.add(
      AnimalList(
        imagePath: 'images/cat.png',
        animalName: '고양이',
        animalCategory: 'cantflymammalia',
      ),
    );
    ani.add(
      AnimalList(
        imagePath: 'images/cow.png',
        animalName: '젖소',
        animalCategory: 'cantflymammalia',
      ),
    );
    ani.add(
      AnimalList(
        imagePath: 'images/dog.png',
        animalName: '강아지',
        animalCategory: 'cantflymammalia',
      ),
    );
    ani.add(
      AnimalList(
        imagePath: 'images/fox.png',
        animalName: '여우',
        animalCategory: 'cantflymammalia',
      ),
    );
    ani.add(
      AnimalList(
        imagePath: 'images/monkey.png',
        animalName: '원숭이',
        animalCategory: 'cantflymammalia',
      ),
    );
    ani.add(
      AnimalList(
        imagePath: 'images/pig.png',
        animalName: '돼지',
        animalCategory: 'cantflymammalia',
      ),
    );
    ani.add(
      AnimalList(
        imagePath: 'images/fox.png',
        animalName: '여우',
        animalCategory: 'cantflymammalia',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ListView Test',
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: ani.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _showDialog(context, index);
              },
              child: Card(
                child: Row(
                  children: [
                    Image.asset(
                      ani[index].imagePath,
                      height: 80,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      ani[index].animalName,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  //----------------------- Function -----------------------
  //  2022-12-19 Hosik

  _showDialog(BuildContext context, int index) {
    varcategory = "";
    canfly = "";
    switch (ani[index].animalCategory) {
      case 'flybug':
        varcategory = '곤충';
        canfly = '있습니다';
        break;
      case 'cantflymammalia':
        varcategory = '포유류';
        canfly = '없습니다';
    }
    showDialog(
      context: context,
      //barrierDismissible: false, // user must tap the button!
      barrierDismissible: true, // user must tap the button!
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text(
            ani[index].animalName,
          ),
          content: Text(
            '이 동물은 $varcategory 입니다. '
            '날 수 $canfly',
          ),
          // content: const Text('YOU JUST ACTIVATED MY TRAP CARD'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text(' Done '),
            ),
          ],
        );
      },
    );
  } // _showDialog END

  // ----------------------- Function END-----------------------
}// END
