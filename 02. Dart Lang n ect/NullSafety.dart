main() {
  int num1 = 100;
  int? num2 = null;

  // int뒤에 ? 이 붙으면 null도 수용할꺼야? 라고 묻는거임

  num2 ??= 0; // null 병합 연산자
  print(num2 ??= 0);
}
