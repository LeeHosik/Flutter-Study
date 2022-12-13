main() {
  getVersionName();
  //String name = getVersionName();
  //보통 이렇게 받아왔는데 에러가 걸리네 ? Future에 뭔가를 줘야겟구나

  getVersionName().then((value) => print(value));
  // fat arrow => 한줄짜리함수라 함수모양(){} 안쓰고 쓰는 함수

  print('end Process');
}

//Future getVersionName() async { 에서 제너릭을 줘야댐
Future<String> getVersionName() async {
  var versionName = await lookUpVersionName();
  return versionName;
} //getVersionName END

String lookUpVersionName() {
  return 'Android Q';
}

/*
life cycle이 없기 때문에 then=> 은 2번째 페이지에서 1번째로 되돌아 올때 데이터를 가지고 올떄 주로 사용되는 방식임 
*/