import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Insert extends StatelessWidget {
  const Insert({super.key});

  @override
  Widget build(BuildContext context) {
    return InsertBody();
  }
}

class InsertBody extends StatefulWidget {
  const InsertBody({super.key});

  @override
  State<InsertBody> createState() => _InsertBodyState();
}

class _InsertBodyState extends State<InsertBody> {
  late TextEditingController nameController;
  late TextEditingController deptController;
  late TextEditingController phoneController;
  late TextEditingController addressController;

  late String name;
  late String dept;
  late String phone;
  late String address;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    deptController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Insert Student',
        ),
      ),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
              child: TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: 'Input Images Address',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                name = nameController.text;
                dept = deptController.text;
                phone = phoneController.text;
                address = addressController.text;
                getJSONData();
              },
              child: const Text(
                'Insert',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- Function
  getJSONData() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/student_insert_flutter.jsp?name=$name&dept=$dept&phone=$phone&address=$address');
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
                  },
                  child: const Text('OK')),
            ],
          );
        });
  }
}// END
