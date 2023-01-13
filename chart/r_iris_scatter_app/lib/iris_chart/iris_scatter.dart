import 'package:flutter/material.dart';
import 'dart:convert'; // for json
import 'package:http/http.dart' as http;
import 'package:r_iris_scatter_app/iris_chart/iris_chart.dart';
import 'package:r_iris_scatter_app/iris_chart/iris_series.dart';

class IrisScatter extends StatefulWidget {
  const IrisScatter({Key? key}) : super(key: key);

  @override
  _IrisScatterState createState() => _IrisScatterState();
}

class _IrisScatterState extends State<IrisScatter> {
  // String result = '';
  late List<IrisSeries> data;

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
        title: const Text('IRIS Scatter Chart'),
        backgroundColor: Colors.red[200],
      ),
      body: Center(
        child: IrisChart(data: data),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url = Uri.parse('http://localhost:8080/Flutter/iris_chart_flutter.jsp');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];

    setState(() {
      for (int i = 0; i < result.length; i++) {
        data.add(IrisSeries(
            petalWidth: double.parse(result[i]['petalWidth']),
            petalLength: double.parse(result[i]['petalLength']),
            species: result[i]['species']));
      }
      // data.addAll(result);
    });
    return response.body;
  }
} // End
