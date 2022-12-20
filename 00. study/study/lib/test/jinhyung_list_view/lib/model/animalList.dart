import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listview_app/model/animal.dart';

class animalList {
  static List<animal> animalview = [
    animal(
        imagePath: 'images/bee.png',
        name: '벌',
        category: '곤충',
        fly: '날 수 있습니다'),
    animal(
        imagePath: 'images/cat.png',
        name: '고양이',
        category: '포유류',
        fly: '날 수 없습니다'),
  ];

  static late TabController controller;
}
