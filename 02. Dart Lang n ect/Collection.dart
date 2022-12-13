main() {
  print('--------------------- Collection ---------------------');

  // List Collection
  List threeKingdoms = []; // << String, Int 구분 없이 사용가능한 Dynamic Type
  threeKingdoms.add('number1 Kingdom');
  threeKingdoms.add('number2 Kingdom');
  threeKingdoms.add('number3 Kingdom');
  threeKingdoms[0] = 'We';

// 삭제는 둘중 하나로 사용
  //threeKingdoms.removeAt(0);
  // threeKingdoms.remove('We');
  threeKingdoms.length;

  List<String> Kingdom = [
    'na',
    'jp',
    'ko',
    'usa',
    'fc',
    'en',
    'jm'
  ]; // << String만 들어갈 수 있게 제너릭 되어있는 상태
  print('--------------------- Map ---------------------');
  Map fruits = {'apple': '사과', 'grape': '포도', 'watermelong': '수박'};
  print(fruits['apple']);
  fruits['watermelon'] = '시원한 수박';
  fruits['banana'] = '바나나';
  Map<String, int> fruitsPrice = {
    'apple': 1000,
  };

  print(fruitsPrice['apple']);

  int appleprice = fruitsPrice['apple']!; //<< Null Safety
}// main
