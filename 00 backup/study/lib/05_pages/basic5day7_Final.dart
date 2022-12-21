import 'package:flutter/material.dart';
import 'package:study/05_pages/view/final_insert.dart';
import 'package:study/05_pages/view/final_list.dart';

class basic5day7_Final extends StatefulWidget {
  const basic5day7_Final({super.key});

  @override
  State<basic5day7_Final> createState() => _basic5day7_FinalState();
}

class _basic5day7_FinalState extends State<basic5day7_Final>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'data',
      //   ),
      // ),
      body: TabBarView(
        controller: tabController,
        children: [
          final_list(),
          //final_insert(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.indigo,
        height: 55,
        child: TabBar(
          labelColor: Colors.amber,
          indicatorColor: Colors.pink,
          unselectedLabelColor: Colors.amber,
          controller: tabController,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.home,
                //  color: Colors.amber,
              ),
            ),
            // Tab(
            //   icon: Icon(
            //     Icons.home,
            //     //color: Colors.blueAccent,
            //   ),
            // ),
            // Tab(
            //   icon: Icon(
            //     Icons.looks_two,
            //     color: Colors.red,
            //   ),
            //),
          ],
        ),
      ),
    );
  }
}
