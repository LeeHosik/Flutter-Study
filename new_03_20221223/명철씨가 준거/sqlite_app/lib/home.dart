import 'package:flutter/material.dart';
import 'package:sqlite_app/model/database_handler.dart';
import 'package:sqlite_app/model/message.dart';
import 'package:sqlite_app/model/students.dart';
import 'package:sqlite_app/view/delete_page.dart';
import 'package:sqlite_app/view/insert_page.dart';
import 'package:sqlite_app/view/update_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DatabaseHandler handler;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    handler.initializeDB().whenComplete(() async {
      // await addStudents();
      setState(() {
        //
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite for Students'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const insertPage();
                },
              )).then((value) => rebuildData());
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: handler.queryStudents(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Students>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: ValueKey(snapshot.data![index]),
                  onDismissed: (DismissDirection direction) async {
                    await handler.deleteStudents(snapshot.data![index].id!);
                    // deleteStudents(snapshot, index);
                    setState(() {
                      snapshot.data!.remove(snapshot.data![index]);
                    });
                  },
                  child: GestureDetector(
                    onTap: () {
                      // updatePage
                      Message.idd = snapshot.data![index].id!;
                      Message.qcode = snapshot.data![index].code;
                      Message.qname = snapshot.data![index].name;
                      Message.qdept = snapshot.data![index].dept;
                      Message.qphone = snapshot.data![index].phone;
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const updatePage();
                        },
                      )).then((value) => rebuildData());
                    },
                    onLongPress: () {
                      // deletePage
                      Message.idd = snapshot.data![index].id!;
                      Message.qcode = snapshot.data![index].code;
                      Message.qname = snapshot.data![index].name;
                      Message.qdept = snapshot.data![index].dept;
                      Message.qphone = snapshot.data![index].phone;
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const deletePage();
                        },
                      )).then((value) => rebuildData());
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Code   :   ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(snapshot.data![index].code),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Name  :   ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(snapshot.data![index].name),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Dept    :   ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(snapshot.data![index].dept),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Phone :   ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(snapshot.data![index].phone),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  // --- Fuctions ---
  // Future<int> deleteStudents(
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

  rebuildData() {
    setState(() {
      handler.queryStudents();
    });
  } //

  // Test용 임시 Data 생성하기
  // Future<int> addStudents() async {
  //   Students firstStudent =
  //       Students(code: '1111', name: '유비', dept: '컴퓨터공학과', phone: '1111');
  //   await handler.insertStudents(firstStudent);
  //   Students secondStudent =
  //       Students(code: '2222', name: '관우', dept: '심리학과', phone: '2222');
  //   await handler.insertStudents(secondStudent);
  //   Students thirdStudent =
  //       Students(code: '3333', name: '장비', dept: '시각디자인학과', phone: '3333');
  //   await handler.insertStudents(thirdStudent);

  //   return 0;
  // }
} //END
