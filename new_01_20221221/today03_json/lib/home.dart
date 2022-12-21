import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // ******************

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return homeBody();
  }
}

class homeBody extends StatefulWidget {
  const homeBody({super.key});

  @override
  State<homeBody> createState() => _homeBodyState();
}

class _homeBodyState extends State<homeBody> {
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
          'J Son',
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                const Text(
                  'Code :  ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  data[index]['code'],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                const Text(
                  'Name :  ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  data[index]['name'],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                const Text(
                  'Dept :  ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  data[index]['dept'],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                const Text(
                  'Phone :  ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  data[index]['phone'],
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
    var url = Uri.parse('https://zeushahn.github.io/Test/student2.json');
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
