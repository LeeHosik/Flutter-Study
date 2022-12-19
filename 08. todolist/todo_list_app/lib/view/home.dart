import 'package:flutter/material.dart';
import 'package:todo_list_app/model/message.dart';
import 'package:todo_list_app/model/todo_list.dart';
import 'package:todo_list_app/view/detail_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<TodoList> todoList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todoList = [];

    // List asdf = """{[],[]} """;

    todoList.add(
      TodoList(
        imagePath: 'images/pika1.png',
        workList: 'pikachu1',
      ),
    );
    todoList.add(
      TodoList(
        imagePath: 'images/pika2.png',
        workList: 'pikachu2',
      ),
    );
    todoList.add(
      TodoList(
        imagePath: 'images/pika3.png',
        workList: 'pikachu3',
      ),
    );
    // todoList.add(
    //   TodoList(
    //     imagePath: 'images/kitasan.jpeg',
    //     workList: 'Kitasan Black',
    //   ),
    // );
    // todoList.add(
    //   TodoList(
    //     imagePath: 'images/DaiwaScarlet.jpeg',
    //     workList: 'Daiwa Scarlet',
    //   ),
    // );
    // todoList.add(
    //   TodoList(
    //     imagePath: 'images/MeishoDoto.jpeg',
    //     workList: 'Meisho Doto',
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Main View',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Insert');

              // Navigator.pushNamed(
              //   context,
              //   '/Insert',
              // ).then((value) => rebuildData());
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, position) {
            return GestureDetector(
              onTap: () {
                Message.workList = todoList[position].workList;
                Message.imagePath = todoList[position].imagePath;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailList(),
                  ),
                );
              },
              child: Card(
                child: Row(
                  children: [
                    Image.asset(
                      todoList[position].imagePath,
                      width: 200,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      todoList[position].workList,
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

  // ------------------ Function ------------------

  rebuildData() {
    if (Message.boolchk == true) {
      setState(() {
        todoList.add(
          TodoList(imagePath: Message.imagePath, workList: Message.workList),
        );
      });
      Message.boolchk = false;
    }
  }

  //------------------ Function END ------------------
}// END
