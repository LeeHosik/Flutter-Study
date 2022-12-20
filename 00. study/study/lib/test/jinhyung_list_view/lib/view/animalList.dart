import 'package:flutter/material.dart';

import 'package:listview_app/model/animal.dart';
import 'package:listview_app/model/animalList.dart';

class animalListView extends StatefulWidget {
  const animalListView({super.key});

  @override
  State<animalListView> createState() => _animalListViewState();
}

class _animalListViewState extends State<animalListView> {
  late List<animal> animalInfo;
  late List<String> category;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    category = ['곤충', '포유류'];
    animalInfo = [];

    animalInfo = animalList.animalview;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Test'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: animalInfo.length,
          itemBuilder: (context, index) {
            final item = index.toString();

            return Dismissible(
              key: Key(item),
              background: Container(
                  alignment: Alignment.centerLeft,
                  color: Colors.red,
                  child: const Icon(Icons.cancel)),
              secondaryBackground: Container(
                  alignment: Alignment.centerRight,
                  color: Colors.green,
                  child: const Icon(Icons.cancel)),
              onDismissed: (direction) {
                animalInfo.removeAt(index);
              },
              confirmDismiss: (direction) {
                if (direction == DismissDirection.startToEnd) {
                  return Future.value(true);
                } else {
                  return Future.value(false);
                }
              },
              child: GestureDetector(
                onTap: () {
                  animaldialog(context, index);
                },
                child: Card(
                  child: Row(
                    children: [
                      Image.asset(
                        animalInfo[index].imagePath,
                        width: 100,
                      ),
                      Text(
                        animalInfo[index].name,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  animaldialog(context, index) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text(animalInfo[index].name),
          content: Text(
              '아래의 동물은 ${animalInfo[index].category}입니다.\n${animalInfo[index].fly}'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("종료")),
          ],
        );
      },
    );
  }
}
