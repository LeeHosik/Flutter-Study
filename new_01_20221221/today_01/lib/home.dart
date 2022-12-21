// import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:today_01/view/first_list.dart';
import 'package:today_01/view/second_insert.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
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
          'data',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/secondInsert');
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          firstList(),
          secondInsert(),
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
