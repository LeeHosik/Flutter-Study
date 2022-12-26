import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sql_write/dat.dart';

import 'package:sql_write/students.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeBody();
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late DatabaseHandler handler;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    handler.initializeDB().whenComplete(() async {
      await addStudents();
      print('home addStudents access! ${addStudents()}');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'data',
        ),
      ),
      body: FutureBuilder(
        future: handler.queryStudents(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Students>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Code : ${snapshot.data![index].code}"),
                        ],
                      ),
                    ],
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

  // -------------------- Function
  Future<int> addStudents() async {
    Students firstStudent = Students(
        code: 'cod1',
        name: 'name1',
        dept: 'dept1',
        phone: 'phone1',
        address: 'address1');
    print('firstStudent access $firstStudent');

    await handler.insertStudents(firstStudent);
    Students secondStudent = Students(
        code: 'cod3e',
        name: 'nam3e',
        dept: 'dept3',
        phone: 'phone3',
        address: 'address3');
    await handler.insertStudents(secondStudent);
    Students thirdStudent = Students(
        code: 'code3',
        name: 'name3',
        dept: 'dept3',
        phone: 'phone3',
        address: 'address3');
    await handler.insertStudents(thirdStudent);
    return 0;
  } // addStudents END

  // -------------------- Function END --------------------
} // END
