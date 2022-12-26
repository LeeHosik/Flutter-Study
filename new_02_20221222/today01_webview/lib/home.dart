import 'dart:async';

import 'package:flutter/material.dart';
import 'package:today01_webview/first_page.dart';
import 'package:today01_webview/second_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeBody();
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
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
          First(),
          Second(),
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
