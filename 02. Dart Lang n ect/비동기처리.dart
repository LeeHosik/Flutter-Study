main() {
  cheeckVersion();
  print('end process');
}

Future cheeckVersion() async {
  // 3.2 flutter 에서는 Future를 빼도 되기는 하는데 일반함수와 구분하기 위해서 쓰는걸 추천
  var version = await lookUpVersion();
  print(version);
}

int lookUpVersion() {
  return 12;
}

/* Async 비동기 방식
  await 가 잠깐 기다리라고 하고 다른거먼저 끝낸뒤 실행
  DB에서 불러올때 주로 사용 
  여기서 await 안쓰면 12 / end process 이렇게 나오고
  await 쓰면 end process / 12 일케 나옴 

use multiple core . 
*/
