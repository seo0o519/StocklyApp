import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatefulWidget {
  @override
  _LineChartState createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  final List<ProfitData> chartData = [
    ProfitData(DateTime(2010), 35),
    ProfitData(DateTime(2011), 28),
    ProfitData(DateTime(2012), 34),
    ProfitData(DateTime(2013), 32),
    ProfitData(DateTime(2014), 40),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        child: SfCartesianChart(
          primaryXAxis: DateTimeAxis(),
          series: <CartesianSeries>[
            LineSeries<ProfitData, DateTime>(
              dataSource: chartData,
              xValueMapper: (ProfitData sales, _) => sales.year,
              yValueMapper: (ProfitData sales, _) => sales.profit,
              name: '수익률',
            ),
          ],
        ),
      ),
    );
  }
}

class ProfitData {
  ProfitData(this.year, this.profit);
  final DateTime year;
  final double profit;
}