import 'dart:html';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class final_insert extends StatefulWidget {
  const final_insert({super.key});

  @override
  State<final_insert> createState() => _final_insertState();
}

class _final_insertState extends State<final_insert> {
  late TextEditingController titleName;
  late String imgPath;

  get listtodoList => null;

  @override
  void initState() {
    super.initState();
    titleName = TextEditingController();
    imgPath = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Insert todoList',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
              child: Row(
                children: [
                  const Text(
                    'Title',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 280,
                    child: TextField(
                      autofocus: true,
                      controller: titleName,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        label: Text(
                          'Input todoList Title',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Select Img',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //buildChips(),

                      ElevatedButton(
                        onPressed: () {
                          //-- abc just img
                        },
                        child: const Icon(
                          Icons.abc,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // -- home just img
                        },
                        child: const Icon(
                          Icons.home,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          //-- just img
                        },
                        child: const Icon(
                          Icons.back_hand,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        todoListOk(context);
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.check,
                          ),
                          Text(
                            'Ok',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.cancel,
                          ),
                          Text(
                            'Cancle',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // --------------- Function ---------------
  // 2022-12-18 00:20

  todoListOk(context) {
    if (titleName.text.trim().isEmpty) {
      _errorSnackBar(context);
    } else {
      Navigator.of(context).pop();
    }
  } //todoListOk END

  _errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Check Input todoList Title',
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  } // errorSnackBar 뚱

//   saveData() async {
//     var takeValue = """[
//       {'titleName': ${titleName.text.trim()}},
//       {'imageName' : ${titleName.text.trim()}}
//     ]""";
//     var storage = await SharedPreferences.getInstance();
//     storage.setString('takeValue', jsonEncode(takeValue));
//   }

//  var w34 = storage.get('name');

} // END
