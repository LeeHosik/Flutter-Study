import 'dart:ffi';

class Students {
  final Int? id;
  final String code;
  final String name;
  final String dept;
  final String phone;
  final String address;

  Students({
    this.id,
    required this.code,
    required this.name,
    required this.dept,
    required this.phone,
    required this.address,
  });

  Students.fromMap(Map<String, dynamic> res) // 생성자 만들기
      : id = res['id'],
        code = res['code'],
        name = res['name'],
        dept = res['dept'],
        phone = res['phone'],
        address = res['address'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'dept': dept,
      'phone': phone,
      'address': address
    };
  }
} //Students
