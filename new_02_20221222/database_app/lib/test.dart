import 'dart:convert';

import 'package:database_app/insert_student.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TestHome extends StatefulWidget {
  const TestHome({super.key});

  @override
  State<TestHome> createState() => _TestHomeState();
}

class _TestHomeState extends State<TestHome> {
  late List data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [];
    getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('data')),
    );
  }

  Future getJsonData() async {
    var url =
        Uri.parse('http://localhost:8080/Flutter/student_query_flutter.jsp');
    var response = await http.get(url);
    print(response.body);

    var dataConvertedJSON = json.decode(
      utf8.decode(
        response.bodyBytes,
      ),
    );
    List result = dataConvertedJSON['result'];
    setState(() {
      data.addAll(result);
    });
    return true;
  }
}
