import 'package:flutter/material.dart';
import 'package:study/05_pages/5day5_tabbar/firstPage.dart';
import 'package:study/05_pages/5day5_tabbar/secondPage.dart';

class basic5day5_tabBar extends StatefulWidget {
  const basic5day5_tabBar({super.key});

  @override
  State<basic5day5_tabBar> createState() => _basic5day5_tabBarState();
}

class _basic5day5_tabBarState extends State<basic5day5_tabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
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
      // appBar: AppBar(
      //   title: const Text(
      //     'Tab Bar Test',
      //   ),
      // ),
      body: TabBarView(
        controller: tabController,
        children: const [
          FirstPage(),
          basic5day5_tabBar(),
          SecondPage(),
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
            Tab(
              icon: Icon(
                Icons.looks_two,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
