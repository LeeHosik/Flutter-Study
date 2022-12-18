//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:study/05_pages/model/message.dart';

import 'package:study/05_pages/model/todo_list.dart';
import 'package:study/05_pages/view/detail_list.dart';
import 'package:study/05_pages/view/final_insert.dart';

class final_list extends StatefulWidget {
  final_list({super.key});

  @override
  State<final_list> createState() => _final_listState();
}

class _final_listState extends State<final_list> {
  late List<TodoList> listtodoList;
  get takeTodoListInsert => null;
  @override
  void initState() {
    super.initState();

    listtodoList = [];

    listtodoList.add(
      TodoList(
        imagePath: 'images/kitasan.jpeg',
        workList: 'Kitasan Black',
      ),
    );
    listtodoList.add(
      TodoList(
        imagePath: 'images/DaiwaScarlet.jpeg',
        workList: 'Daiwa Scarlet',
      ),
    );
    listtodoList.add(
      TodoList(
        imagePath: 'images/MeishoDoto.jpeg',
        workList: 'Meisho Doto',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TODO LIST',
        ),
        actions: [
          IconButton(
            onPressed: () {
              moveTodoListInsert();
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: listtodoList.length,
          itemBuilder: (context, position) {
            return GestureDetector(
              onTap: () {
                Message.workList = listtodoList[position].workList;
                Message.image123 = listtodoList[position].imagePath;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Detail_list(),
                  ),
                );
              },
              child: Card(
                child: Row(
                  children: [
                    Image.asset(
                      listtodoList[position].imagePath,
                      width: 200,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      listtodoList[position].workList,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // ------------ Function ------------
  moveTodoListInsert() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => final_insert(),
      ),
    );
  } // moveTodoListInsert
  // ------------ Function END ------------

}//END
