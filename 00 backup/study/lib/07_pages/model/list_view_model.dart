class umamusume_model {
  String imgName;
  String imgPath;
  String category;
  String sakusen;

  umamusume_model(
      {required this.imgName,
      required this.imgPath,
      required this.category,
      required this.sakusen});
}

class staticMessage {
  static String name = '';
  static String imgPath = '';
  static String category = '';
  static String sakusen = '';
  static bool boolchk = true;
}
