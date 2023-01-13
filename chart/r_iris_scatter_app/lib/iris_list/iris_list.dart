import 'package:flutter/material.dart';
import 'dart:convert'; // for json
import 'package:http/http.dart' as http;

class IrisList extends StatefulWidget {
  const IrisList({Key? key}) : super(key: key);

  @override
  _IrisListState createState() => _IrisListState();
}

class _IrisListState extends State<IrisList> {
  String result = '';
  late List data;

  @override
  void initState() {
    super.initState();
    data = [];
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IRIS Data List'),
        backgroundColor: Colors.black87,
      ),
      body: SizedBox(
        child: Center(
          child: data.isEmpty
              ? const Text(
                  '데이터가 없습니다.',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Card(
                        color: data[index]['species'] == 'setosa'
                            ? Colors.green[200]
                            : data[index]['species'] == 'versicolor'
                                ? Colors.blue[200]
                                : Colors.red[200],
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 4, 0, 4),
                          child: Row(
                            children: [
                              Text(
                                '${index + 1}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "Sepal.Length :",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(data[index]['sepallength']
                                            .toString()),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        const Text(
                                          "Sepal.Width :",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(data[index]['sepalwidth']
                                            .toString()),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "Petal.Length :",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(data[index]['petallength']
                                            .toString()),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        const Text(
                                          "Petal.Width :",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(data[index]['petalwidth']
                                            .toString()),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "Species :",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(data[index]['species'].toString()),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: data.length,
                ),
        ),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url = Uri.parse('http://localhost:8080/Flutter/iris_query_flutter.jsp');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];

    setState(() {
      data.addAll(result);
    });
    return response.body;
  }
} // End
