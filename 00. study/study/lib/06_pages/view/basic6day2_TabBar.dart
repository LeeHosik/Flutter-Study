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
      appBar: AppBar(
        title: const Text(
          'Flower List VIew',
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          basic6day2_img_listview_secondPage(),
          basic6day2_img_listview_firstPage(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.indigo,
        height: 55,
        child: TabBar(
          labelColor: Colors.purple,
          indicatorColor: Colors.pink,
          unselectedLabelColor: Colors.amber,
          controller: tabController,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.looks_one,
                //  color: Colors.amber,
              ),
              text: 'one',
            ),
            Tab(
              icon: Icon(
                Icons.home,
                //color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
