import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController sepalLengthController;
  late TextEditingController sepalWidthController;
  late TextEditingController petalLengthController;
  late TextEditingController petalWidthController;

  late String sepalLength;
  late String sepalWidth;
  late String petalLength;
  late String petalWidth;

  late String imageName;
  String result = "all";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sepalLengthController = TextEditingController();
    sepalWidthController = TextEditingController();
    petalLengthController = TextEditingController();
    petalWidthController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'R serve - IRIS 품종 예측',
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: sepalLengthController,
                    textInputAction: TextInputAction.go,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                      hintText: 'Input Sepal Length',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: sepalWidthController,
                    textInputAction: TextInputAction.go,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                      hintText: 'Input sepal Width',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: petalLengthController,
                    textInputAction: TextInputAction.go,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                      hintText: 'Input Petal Length',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: petalWidthController,
                    textInputAction: TextInputAction.go,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                      hintText: 'Input Petal Width',
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                ElevatedButton(
                  onPressed: () {
                    sepalLength = sepalLengthController.text;
                    sepalWidth = sepalWidthController.text;
                    petalLength = petalLengthController.text;
                    petalWidth = petalWidthController.text;

                    getJSONData();
                  },
                  child: const Text(
                    'Enter',
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'images/$result.jpg',
                  ),
                  radius: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// ------------- Function -------------
// 2022-12-28 Hosik
  getJSONData() async {
    var url = Uri.parse(
        'http://localhost:8080/Rserve/response_iris.jsp?sepalLength=$sepalLength&sepalWidth=$sepalWidth&petalLength=$petalLength&petalWidth=$petalWidth');
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'];
    });
    _showDialog(context, result);
  }

  _showDialog(BuildContext context, String result) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('품종 예측 결과'),
            content: Text('입력하신 품종은 $result 입니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    imageName = result;
                  });
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'OK',
                ),
              ),
            ],
          );
        });
  }
}// END
