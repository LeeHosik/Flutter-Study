import 'package:flutter/material.dart';
import 'package:sqlite_app/model/message.dart';

import '../model/database_handler.dart';
import '../model/students.dart';

class updatePage extends StatefulWidget {
  const updatePage({super.key});

  @override
  State<updatePage> createState() => _updatePageState();
}

class _updatePageState extends State<updatePage> {
  late String code;
  late String name;
  late String dept;
  late String phone;
  late TextEditingController cController;
  late TextEditingController nController;
  late TextEditingController dController;
  late TextEditingController pController;
  late DatabaseHandler handler;

  @override
  void initState() {
    super.initState();
    cController = TextEditingController();
    nController = TextEditingController();
    dController = TextEditingController();
    pController = TextEditingController();
    cController.text = Message.qcode;
    nController.text = Message.qname;
    dController.text = Message.qdept;
    pController.text = Message.qphone;
    handler = DatabaseHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Page'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: cController,
              readOnly: true,
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: nController,
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: dController,
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: pController,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                code = cController.text;
                name = nController.text;
                dept = dController.text;
                phone = pController.text;
                _showDialog(context);
                updateStudents();
                // getJSONData();
              },
              child: const Text('EDIT'),
            ),
          ],
        ),
      ),
    );
  }

  // --- F
  Future<int> updateStudents() async {
    Students firstStudent = Students(
        id: Message.idd,
        code: cController.text.trim(),
        name: nController.text.trim(),
        dept: dController.text.trim(),
        phone: pController.text.trim());
    await handler.updateStudents(firstStudent);

    return 0;
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('수정 결과'),
          content: const Text('수정이 완료 되었습니다.'),
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
} //END
