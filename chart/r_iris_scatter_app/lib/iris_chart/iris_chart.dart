import 'package:flutter/material.dart';
import 'package:r_iris_scatter_app/iris_chart/iris_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class IrisChart extends StatelessWidget {
  final List<IrisSeries> data;
  const IrisChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<IrisSeries, num>> series = [
      charts.Series(
          id: "iris",
          data: data,
          // x-axis
          domainFn: (IrisSeries series, _) => series.petalWidth,
          // y-axis
          measureFn: (IrisSeries series, _) => series.petalLength,
          // individual color
          colorFn: (IrisSeries series, _) {
            return series.species == 'setosa'
                ? charts.ColorUtil.fromDartColor(Colors.green)
                : series.species == 'versicolor'
                    ? charts.ColorUtil.fromDartColor(Colors.blue)
                    : charts.ColorUtil.fromDartColor(Colors.red);
          })
    ];
    // return charts.BarChart(series, animate: true); // Version 1
    return SizedBox(
      height: 700,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const Text(
                  'Iris Scatter Chart',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: charts.ScatterPlotChart(
                    series,
                    animationDuration: const Duration(seconds: 3),
                    domainAxis: const charts.NumericAxisSpec(
                      tickProviderSpec:
                          charts.BasicNumericTickProviderSpec(zeroBound: false),
                      // viewport: charts.NumericExtents(2016.0, 2022.0),
                    ),
                    animate: true,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
