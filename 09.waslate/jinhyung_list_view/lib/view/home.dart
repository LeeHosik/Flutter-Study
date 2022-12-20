import 'package:flutter/material.dart';
import 'package:listview_app/model/animalList.dart';

import 'package:listview_app/view/animalInsert.dart';
import 'package:listview_app/view/animalList.dart';

class Home extends StatefulWidget {
  final String id;
  final String pw;
  const Home({super.key, required this.id, required this.pw});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animalList.controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animalList.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: animalList.controller,
        children: const [
          animalListView(),
          animalInsert(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        child: TabBar(
          controller: animalList.controller,
          labelColor: Colors.blueAccent,
          indicatorColor: Colors.red,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.looks_one,
              ),
              text: 'one',
            ),
            Tab(
              icon: Icon(
                Icons.looks_two,
              ),
              text: 'two',
            ),
          ],
        ),
      ),
    );
  }
}
