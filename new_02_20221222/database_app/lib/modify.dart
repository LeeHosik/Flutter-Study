import 'package:database_app/detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Modify extends StatelessWidget {
  const Modify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Modify ',
        ),
      ),
      body: ModifyBody(),
    );
  }
}

class ModifyBody extends StatefulWidget {
  const ModifyBody({super.key});

  @override
  State<ModifyBody> createState() => _ModifyBodyState();
}

class _ModifyBodyState extends State<ModifyBody> {
  late TextEditingController nameController;
  late TextEditingController deptController;
  late TextEditingController phoneController;
  // late TextEditingController addressController;

  late String name;
  late String dept;
  late String phone;
  late String address;
  late String code2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    value = Get.arguments ?? "_";
    nameController = TextEditingController();
    deptController = TextEditingController();
    phoneController = TextEditingController();
    // addressController = TextEditingController();
    print(value);
    code2 = value['code'];

    nameController.text = value['name'];
    deptController.text = value['dept'];
    phoneController.text = value['phone'];
    // nameController.text = value['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Input Name',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextField(
                controller: deptController,
                decoration: const InputDecoration(
                  labelText: 'Input saksen',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Input aaaa',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
            //   child: TextField(
            //     controller: addressController,
            //     decoration: const InputDecoration(
            //       labelText: 'Input Images Address',
            //     ),
            //     keyboardType: TextInputType.text,
            //   ),
            // ),
            ElevatedButton(
              onPressed: () {
                name = nameController.text;
                dept = deptController.text;
                phone = phoneController.text;
                // address = addressController.text;
                getJSONData();
              },
              child: const Text(
                'Modify',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------------ Function ------------------------
  // 2022-12-22 Hosik

  // Update SQL
  getJSONData() async {
    int code;
    name = nameController.text.trim();
    print(name);
    dept = deptController.text.trim();
    print(dept);
    phone = phoneController.text.trim();
    print(phone);
    address = value['address'];
    print(address);
    code = int.parse(code2);
    print(code);
    var url = Uri.parse(
        'http://localhost:8080/Flutter/student_modify_flutter.jsp?name=$name&dept=$dept&phone=$phone&address=$address&code=$code');
    await http.get(url);
    _showDialog(context);
  }

  _showDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              '입력 결과',
            ),
            content: const Text('complete'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context);
                  Get.back();
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }
  //------------------------ Function END ------------------------
} // END
