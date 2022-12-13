main() {
  ThreeKingdoms trKing = ThreeKingdoms('hosik', 'we');
  trKing.saySomething();
}

class ThreeKingdoms {
  // Field or Property    dart는 초기값이 있어야 됨, 초기값이 없을때 필요한게 null safety
  String? name;
  String name2 = "";
  late String nation; // << 바로 data가 들어올꺼야 하면은 late를 붙여도 됨

  // Constructor
  ThreeKingdoms(String name, String nation)
      : this.name = name,
        this.nation = nation;

  //생성자는 클래스 이름과 같아야하니까~
  // this.name은 property, = name 에서는 threeKingdoms(String name)의 name

  // Function
  saySomething() {
    print('제 이름은 ${this.name} 이고 조국은 ${this.nation} 입니다. ');
    // this 가 들어가서 {}가 들어가야 댐
  }
} //main end
