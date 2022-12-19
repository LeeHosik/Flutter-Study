import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:horizontal_card_pager/card_item.dart';

class list_view_model {
  String imgName;
  String imgPath;
  String Category;

  list_view_model(
      {required this.imgName, required this.imgPath, required this.Category});

  // List<CardItem> imgitems = [
  //   ImageCarditem(
  //     image: Image.asset(
  //       'images/flower_01.png',
  //     ),
  //   ),
  //   ImageCarditem(
  //     image: Image.asset(
  //       'images/flower_02.png',
  //     ),
  //   ),
  //   ImageCarditem(
  //     image: Image.asset(
  //       'images/flower_03.png',
  //     ),
  //   ),
  //   ImageCarditem(
  //     image: Image.asset(
  //       'images/flower_04.png',
  //     ),
  //   ),
  //   ImageCarditem(
  //     image: Image.asset(
  //       'images/flower_05.png',
  //     ),
  //   ),
  //   ImageCarditem(
  //     image: Image.asset(
  //       'images/flower_06.png',
  //     ),
  //   ),
  // ];
}

class staticMessage {
  static String name = '';
  static String imgPath = '';
  static String category = '';
  static bool canFly = false;
  static bool boolchk = false;
}

// class img {
//   List<CardItem> imgitems = [
//     ImageCarditem(
//       image: Image.asset(
//         'images/flower_01.png',
//       ),
//     ),
//     ImageCarditem(
//       image: Image.asset(
//         'images/flower_02.png',
//       ),
//     ),
//     ImageCarditem(
//       image: Image.asset(
//         'images/flower_03.png',
//       ),
//     ),
//     ImageCarditem(
//       image: Image.asset(
//         'images/flower_04.png',
//       ),
//     ),
//     ImageCarditem(
//       image: Image.asset(
//         'images/flower_05.png',
//       ),
//     ),
//     ImageCarditem(
//       image: Image.asset(
//         'images/flower_06.png',
//       ),
//     ),
//   ];
// }
