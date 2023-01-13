// Model Dart
class Students {
  final int? id; //  ? = nullsafty autoincrement라서 ㅇㅇ 값안주고 자동생성이니까 ㅇㅇ
  final String code;
  final String name;
  final String dept;
  final String phone;

  // Constructor
  Students(
      {this.id,
      required this.code,
      required this.name,
      required this.dept,
      required this.phone});

// dart에서는 중복이름이 안되기 때문에 생성자를 만들어서 쓴다.
  Students.formMap(Map<String, dynamic> res)
      : id = res['id'],
        code = res['code'],
        name = res['name'],
        dept = res['dept'],
        phone = res['phone'];

  Map<String, Object?> toMap() {
    return {'id': id, 'code': code, 'name': name, 'dept': dept, 'phone': phone};
  }
}
