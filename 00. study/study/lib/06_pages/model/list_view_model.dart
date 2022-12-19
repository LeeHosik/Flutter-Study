import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:horizontal_card_pager/card_item.dart';

class list_view_model {
  String imgName;
  String imgPath;
  String Category;

  list_view_model(
      {required this.imgName, required this.imgPath, required this.Category});
}

class staticMessage {
  static String name = '';
  static String imgPath = '';
  static String category = '';
  static List<bool> sakusen = [];
  static bool boolchk = false;
}

// class img {
