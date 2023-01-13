import 'package:flutter/material.dart';
import 'dart:convert'; // for json
import 'package:http/http.dart' as http;
import 'package:r_iris_scatter_app/iris_dup_chart/iris_chart_dup.dart';
import 'package:r_iris_scatter_app/iris_dup_chart/iris_series_dup.dart';

class IrisScatterDup extends StatefulWidget {
  const IrisScatterDup({Key? key}) : super(key: key);

  @override
  _IrisScatterDupState createState() => _IrisScatterDupState();
}

class _IrisScatterDupState extends State<IrisScatterDup> {
  // String result = '';
  late List<IrisSeriesDup> data;

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
        title: const Text('IRIS Scatter Dup Chart'),
        backgroundColor: Colors.blue[200],
      ),
      body: Center(
        child: IrisChartDup(data: data),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url =
        Uri.parse('http://localhost:8080/Flutter/iris_chart_dup_flutter.jsp');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];

    setState(() {
      for (int i = 0; i < result.length; i++) {
        data.add(
          IrisSeriesDup(
            petalWidth: double.parse(result[i]['petalWidth']),
            petalLength: double.parse(result[i]['petalLength']),
            species: result[i]['species'],
            dupCount: int.parse(result[i]['dupCount']),
          ),
        );
      }
    });
    return response.body;
  }
} // End
