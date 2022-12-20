import 'package:flutter/material.dart';

import 'package:study/06_pages/model/list_view_model.dart';
import 'package:study/06_pages/model/umamusume_list.dart';

class basic6day2_img_listview_secondPageList extends StatefulWidget {
  const basic6day2_img_listview_secondPageList({super.key});

  @override
  State<basic6day2_img_listview_secondPageList> createState() =>
      _basic6day2_img_listview_secondPageState();
}

class _basic6day2_img_listview_secondPageState
    extends State<basic6day2_img_listview_secondPageList> {
  late List<umamusume_model> umamusume;
  @override
  void initState() {
    super.initState();
    umamusume = [];
    umamusume = musumeList.umamusume;
    //rebuildData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        // itemCount: umamusume.length,
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
    );
  }
  // ---------------- Function ----------------
  // 2022-12-19 Hosik

  // rebuildData() {
  //   if (staticMessage.boolchk == true) {
  //     setState(() {
  //       print('rebuildData 안에서  ${umamusume.length}');
  //       umamusume.add(
  //         umamusume_model(
  //           imgName: staticMessage.name,
  //           imgPath: "images ${staticMessage.imgPath}.png",
  //           category: staticMessage.category,
  //           sakusen: staticMessage.sakusen,
  //         ),
  //       );
  //     });
  //     staticMessage.boolchk = false;
  //   }
  // }

// ---------------- Function END ----------------
}// END
