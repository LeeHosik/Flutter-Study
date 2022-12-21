import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // ******************

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

class _HomeBodyState extends State<HomeBody> {
  late List data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [];
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Network JSON Test',
        ),
      ),
      body: Center(
        child: data.isEmpty
            // ? CircularProgressIndicator()
            // ? CupertinoActivityIndicator()
            ? Image.asset('images/sense.jpeg')
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return cardBuild(context, index);
                },
              ),
      ),
    );
  }

  Widget cardBuild(BuildContext context, int index) {
    return Card(
      color: index % 3 == 0
          ? Colors.pink
          : index % 3 == 1
              ? Colors.amber
              : Colors.amber,
      // Colors.pink,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                  child: Image.network(
                    data[index]['image'],
                    //cacheWidth: 200,
                    cacheHeight: 90,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data[index]['title'],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  } // cardBuild END

// --------------------- Function ---------------------
// 2022-12-21 Hosik
  Future<bool> getJSONData() async {
    var url = Uri.parse('https://zeushahn.github.io/Test/movies.json');
    var respons = await http.get(url);
    // print(respons.body); // 잘 왔나 print 로 확인
    var dateConvertedJSON = json.decode(
      utf8.decode(
        respons.bodyBytes,
      ),
    );
    List result = dateConvertedJSON['results'];
    setState(() {
      data.addAll(result);
    });
    return true;
  } // getJSONData END

  // cardBuild(context, index) {}

// --------------------- Function END ---------------------

} // END