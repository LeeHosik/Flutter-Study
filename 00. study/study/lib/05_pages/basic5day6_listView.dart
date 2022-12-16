import 'package:flutter/material.dart';

class basic5day6_listView extends StatefulWidget {
  const basic5day6_listView({super.key});

  @override
  State<basic5day6_listView> createState() => _basic5day6_listViewState();
}

class _basic5day6_listViewState extends State<basic5day6_listView> {
  late List<int> todoList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todoList = [];

    for (int i = 1; i <= 100; i++) {
      todoList.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'data',
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 100,
              child: Card(
                color: index % 6 == 0
                    ? Colors.red
                    : index % 6 == 1
                        ? Colors.amber
                        : index % 6 == 2
                            ? Colors.blueAccent
                            : index % 6 == 3
                                ? Colors.purple
                                : index % 6 == 4
                                    ? Colors.yellowAccent
                                    : Colors.black,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          index % 3 == 0
                              ? Image.asset('images/kitasan.jpeg')
                              : index % 3 == 1
                                  ? Image.asset('images/smile.png')
                                  : Image.asset('images/trapcard.jpeg'),
                          //Image.asset('images/lamp_red.png'),
                        ],
                      ),
                      Text(
                        todoList[index].toString(),
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                //    ],
                //  ),
              ),
            );
          },
        ),
      ),
    );
  }
}
