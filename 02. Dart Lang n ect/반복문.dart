main() {
  List<int> intArray = [1, 2, 3];
  for (int i = 0; i < intArray.length; i++) {
    print(intArray[i]);
  } // java Style

  for (int i in intArray) {
    print(i);
  } // 이후 스타일 for in
}
