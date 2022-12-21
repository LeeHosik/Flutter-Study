import 'package:flutter/material.dart';

import 'package:study/06_pages/model/umamusume_list.dart';
import 'package:study/06_pages/model/list_view_model.dart';

class b7day6_PickerView_exercise extends StatefulWidget {
  const b7day6_PickerView_exercise({super.key});

  @override
  State<b7day6_PickerView_exercise> createState() =>
      _b7day6_PickerView_exerciseState();
}

class _b7day6_PickerView_exerciseState
    extends State<b7day6_PickerView_exercise> {
  late List<umamusume_model> umamusume;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    umamusume = [];
    umamusume = musumeList.umamusume;
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
              Navigator.pushNamed(
                context,
                '/b7day6_PickerView_exercise_2',
              );
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: umamusume.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Card(
                child: Row(
                  children: [
                    Image.asset(
                      umamusume[index].imgPath,
                      height: 90,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      umamusume[index].imgName,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      umamusume[index].category,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      umamusume[index].sakusen,
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
}
