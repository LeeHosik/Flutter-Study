import 'dart:convert';

main() {
  // """ 3개짜리 안에 마음것 사용가능함
  var jsonString = """ 
[
  {
    "score" : 40
  },
  {
    "score" : 80
  }
]
""";

//Decode는 json을 list형식으로 만드는거

  var score = jsonDecode(jsonString); // << 알아서 convert 됨
  print(score is List);
  print(score[0]["score"]);
} //Main END
//List 와 Map을 합쳐놓은것
