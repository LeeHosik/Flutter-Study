import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController deptController;
  late TextEditingController phoneController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    codeController = TextEditingController();
    nameController = TextEditingController();
    deptController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Insert Students',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  //hintText: 'Code',
                  labelText: 'name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: deptController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  //hintText: 'Code',
                  labelText: 'dept',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  //hintText: 'Code',
                  labelText: 'phone',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: codeController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  //hintText: 'Code',
                  labelText: 'code',
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                String code = codeController.text;
                String name = nameController.text;
                String dept = deptController.text;
                String phone = phoneController.text;
                OK(code, name, dept, phone);
              },
              child: const Text(
                'OK',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- Function ----------------
  OK(String code, String name, String dept, String phone) {
    FirebaseFirestore.instance.collection('student').add(
      {
        'code': code,
        'name': name,
        'dept': dept,
        'phone': phone,
      },
    );
    _showDialog(context);
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Result Input',
            ),
            content: const Text('Succex '),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pop(context);
                },
                child: const Text(
                  'ok',
                ),
              ),
            ],
          );
        });
  }

  // ---------------- Function ----------------
}//END
