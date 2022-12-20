import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:listview_app/model/animal.dart';
import 'package:listview_app/model/animalList.dart';

class animalInsert extends StatefulWidget {
  const animalInsert({super.key});

  @override
  State<animalInsert> createState() => _animalInsertState();
}

class _animalInsertState extends State<animalInsert> {
  late TextEditingController controller;

  late List<double> imagesize;
  late List<String> imagename;
  late String selectimage;
  late bool flyValue;
  late String categoryValue;
  late String flyValueStr;
  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
    imagesize = [50, 50, 50, 50, 50, 50, 50, 50];
    imagename = [
      'images/bee.png',
      'images/cat.png',
      'images/cow.png',
      'images/dog.png',
      'images/fox.png',
      'images/monkey.png',
      'images/pig.png',
      'images/wolf.png'
    ];
    flyValue = false;
    categoryValue = '파충류';
    selectimage = 'images/bee.png';
    flyValueStr = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView Insert"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: controller,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomSlidingSegmentedControl<String>(
                initialValue: categoryValue,
                children: const {
                  '양서류': Text('양서류'),
                  '파충류': Text('파충류'),
                  '포유류': Text('포유류'),
                },
                decoration: BoxDecoration(
                  color: CupertinoColors.lightBackgroundGray,
                  borderRadius: BorderRadius.circular(8),
                ),
                thumbDecoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.3),
                      blurRadius: 4.0,
                      spreadRadius: 1.0,
                      offset: const Offset(
                        0.0,
                        2.0,
                      ),
                    ),
                  ],
                ),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInToLinear,
                onValueChanged: (value) {
                  categoryValue = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("날 수 있나요?"),
                    const SizedBox(
                      width: 50,
                    ),
                    CupertinoSwitch(
                      value: flyValue,
                      onChanged: (value) {
                        setState(() {
                          flyValue = value;
                        });
                      },
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              clickImage(0);
                            },
                            child: Image.asset(
                              'images/bee.png',
                              width: imagesize[0],
                              height: imagesize[0],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              clickImage(1);
                            },
                            child: Image.asset(
                              'images/cat.png',
                              width: imagesize[1],
                              height: imagesize[1],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              clickImage(2);
                            },
                            child: Image.asset(
                              'images/cow.png',
                              width: imagesize[2],
                              height: imagesize[2],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              clickImage(3);
                            },
                            child: Image.asset(
                              'images/dog.png',
                              width: imagesize[3],
                              height: imagesize[3],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              clickImage(4);
                            },
                            child: Image.asset(
                              'images/fox.png',
                              width: imagesize[4],
                              height: imagesize[4],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              clickImage(5);
                            },
                            child: Image.asset(
                              'images/monkey.png',
                              width: imagesize[5],
                              height: imagesize[5],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              clickImage(6);
                            },
                            child: Image.asset(
                              'images/pig.png',
                              width: imagesize[6],
                              height: imagesize[6],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              clickImage(7);
                            },
                            child: Image.asset(
                              'images/wolf.png',
                              width: imagesize[7],
                              height: imagesize[7],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    insertAnimal(context);
                  },
                  child: const Text("동물 추가하기")),
            ],
          ),
        ),
      ),
    );
  }

  clickImage(index) {
    setState(() {
      for (int i = 0; i < imagesize.length; i++) {
        imagesize[i] = 50;
      }
      imagesize[index] = 100;
      selectimage = imagename[index];
    });
  }

  insertAnimal(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('동물 추가하기'),
          content: Text(
              "이 동물은 '${controller.text}'입니다. \n또 동물의 종류는 ${categoryValue} 입니다.\n이 동물을 추가하시겠습니까?"),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  addlist();
                  animalList.controller.animateTo(0);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text("예")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text("아니오")),
          ],
        );
      },
    );
  }

  addlist() {
    if (flyValue == true) {
      flyValueStr = "날 수 있습니다";
    } else {
      flyValueStr = "날 수 없습니다";
    }
    animalList.animalview.add(animal(
        imagePath: selectimage,
        name: controller.text,
        category: categoryValue,
        fly: flyValueStr));
    setState(() {
      categoryValue = '파충류';
      flyValue = false;
      controller.text = '';
      for (int i = 0; i < imagesize.length; i++) {
        imagesize[i] = 50;
      }
    });
  }
}
