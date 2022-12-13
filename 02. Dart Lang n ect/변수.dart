main() {
  int intNum1 = 30;
  int intNum2 = 20;

  print(intNum1 / intNum2);
  print(4 / 0);
  print(intNum1 ~/ intNum2);

// 문자열 처리
  var name = 'Kitsan Black';
  var name2 = "Agunes Digital";
  print((name) + name2);

// 문자열 보간법 (String interpolation)
  print('$name : $name2');

  print('intNum1과 intNum2의 합은 ${intNum1 + intNum2} desu');
}// main end
