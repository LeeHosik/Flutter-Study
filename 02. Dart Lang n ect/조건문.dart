main() {
  // 삼항연산자
  bool isPublic = true;
  var visibility = isPublic ? 'public' : 'private';
  print(visibility);
  // DB연결중에 데이터가 불러오는중이라고 뺑뺑이 돌아올때 사용할 수 있음
  // 데이터가 있으면 private가 나오고, 아니면 public에 뺑뺑이가 나오는 식인거임
}
