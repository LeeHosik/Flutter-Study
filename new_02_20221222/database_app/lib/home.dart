import 'dart:convert';

import 'package:database_app/detail.dart';
import 'package:database_app/insert_student.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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
    super.initState();
    data = [];
    getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'database',
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await Get.to(
                const Insert(),
              );
              getJsonData();
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Center(
        child: data.isEmpty
            ? const Text(
                'Noting Data',
              )
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
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    print(data[index]);
                    Get.to(
                      const Detail(),
                      arguments: data[index],
                    );

                    // Get.toNamed(
                    //   '/Detail?name=${data[index]['name']}',
                    // );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: Image.network(
                      data[index]['address'],
                      //cacheWidth: 100,
                      // cacheHeight: 90,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data[index]['name'],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data[index]['dept'],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data[index]['phone'],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text(
                //     data[index]['code'],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  } // cardBuild END

  //  ----------------- Function -----------------
  // 2022-12-22 Hosik
  Future getJsonData() async {
    var url =
        Uri.parse('http://localhost:8080/Flutter/student_query_flutter.jsp');
    var response = await http.get(url);
    print(response.body);
    print('여기가 어딘교');
    data.clear();
    var dataConvertedJSON = json.decode(
      utf8.decode(
        response.bodyBytes,
      ),
    );
    List result = dataConvertedJSON['results'];
    setState(() {
      data.addAll(result);
    });
    return true;
  }

  // ----------------- Function END
}// END
