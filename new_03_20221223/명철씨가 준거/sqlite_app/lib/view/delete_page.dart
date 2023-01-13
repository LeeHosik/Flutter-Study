import 'package:flutter/material.dart';
import 'package:sqlite_app/model/database_handler.dart';
import 'package:sqlite_app/model/message.dart';

import '../model/students.dart';

class deletePage extends StatefulWidget {
  const deletePage({super.key});

  @override
  State<deletePage> createState() => _deletePageState();
}

class _deletePageState extends State<deletePage> {
  late String code;
  late String name;
  late String dept;
  late String phone;
  late int ids;
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
    ids = Message.idd;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Page'),
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
                deleteStudents();
                // getJSONData();
              },
              child: const Text('DELETE'),
            ),
          ],
        ),
      ),
    );
  }

  // --- F
  Future<int> deleteStudents() async {
    Students firstStudent = Students(
        id: ids,
        code: cController.text.trim(),
        name: nController.text.trim(),
        dept: dController.text.trim(),
        phone: pController.text.trim());

    await handler.deleteStudent(firstStudent);

    return 0;
  }

  // Future<int> deleteStudent(
  //     AsyncSnapshot<List<Students>> snapshot, index) async {
  //   Students student = Students(
  //       id: snapshot.data![index].id,
  //       code: snapshot.data![index].code,
  //       name: snapshot.data![index].name,
  //       dept: snapshot.data![index].dept,
  //       phone: snapshot.data![index].phone);
  //   await handler.deleteStudents(student);
  //   return 0;
  // }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('삭제 결과'),
          content: const Text('삭제가 완료 되었습니다.'),
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
