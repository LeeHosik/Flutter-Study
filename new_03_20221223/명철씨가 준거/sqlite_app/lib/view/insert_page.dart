import 'package:flutter/material.dart';
import 'package:sqlite_app/model/database_handler.dart';

import '../model/students.dart';

class insertPage extends StatefulWidget {
  const insertPage({super.key});

  @override
  State<insertPage> createState() => _insertPageState();
}

class _insertPageState extends State<insertPage> {
  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController deptController;
  late TextEditingController phoneController;
  late DatabaseHandler handler;

  @override
  void initState() {
    super.initState();
    codeController = TextEditingController();
    nameController = TextEditingController();
    deptController = TextEditingController();
    phoneController = TextEditingController();

    handler = DatabaseHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert Page'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: codeController,
              decoration: const InputDecoration(labelText: '학번을 입력하세요.'),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: '이름을 입력하세요.'),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: deptController,
              decoration: const InputDecoration(labelText: '전공을 입력하세요.'),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: '전화번호를 입력하세요.'),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                addStudents();
                _showDialog(context);
              },
              child: const Text('입력'),
            ),
          ],
        ),
      ),
    );
  }

  // --- F
  Future<int> addStudents() async {
    Students firstStudent = Students(
        code: codeController.text.trim(),
        name: nameController.text.trim(),
        dept: deptController.text.trim(),
        phone: phoneController.text.trim());
    await handler.insertStudents(firstStudent);

    return 0;
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('입력 결과'),
          content: const Text('입력이 완료 되었습니다.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
  // --- F

} //END
