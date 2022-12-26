import 'package:database_app/modify.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart';

late var value;

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail View'),
          actions: [
            IconButton(
              onPressed: () => Get.to(
                const Modify(),
                arguments: value,
              ),
              icon: Icon(Icons.edit),
            ),
          ],
        ),
        body: DetailBody());
  }
}

class DetailBody extends StatefulWidget {
  const DetailBody({super.key});

  @override
  State<DetailBody> createState() => _DetailBodyState();
}

class _DetailBodyState extends State<DetailBody> {
  late String name;
  late String phone;
  late String dept;
  late String addres;

  //late String address;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    value = Get.arguments ?? "_";
    name = value['name'] ?? '_';
    phone = value['phone'] ?? '_';
    dept = value['dept'] ?? '_';
    addres = value['address'] ?? '_';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  addres,
                  // width: 250,
                ),
              ),
              Text(
                name,
              ),
              Text(
                dept,
              ),
              Text(
                phone,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
