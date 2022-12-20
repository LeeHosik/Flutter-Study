import 'package:flutter/material.dart';

import 'package:study/06_pages/view/basic6day2_img_listview_firstPage.dart';
import 'package:study/06_pages/view/basic6day2_img_listview_secondPage.dart';

class basic6day2_TabBar extends StatefulWidget {
  const basic6day2_TabBar({super.key});

  @override
  State<basic6day2_TabBar> createState() => _basic6day2_TabBarState();
}

class _basic6day2_TabBarState extends State<basic6day2_TabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    /// tabbar 할때 이 종료 안해주면 쓰래기 엄청 쌓임
    tabController.dispose(); // <<<<<<<<
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        //wrap with PreferredSize
        preferredSize: Size.fromHeight(35), //height of appbar
        child: AppBar(
          title: const Text(
            'Flower List VIew',
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          basic6day2_img_listview_secondPageList(),
          basic6day2_img_listview_firstPageInsert(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 40,
        child: TabBar(
          labelColor: Colors.amber,
          indicatorColor: Colors.blue,
          unselectedLabelColor: Colors.amber,
          controller: tabController,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.list,
                //  color: Colors.amber,
              ),
              //  text: 'list',
            ),
            Tab(
              icon: Icon(
                Icons.add,
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
