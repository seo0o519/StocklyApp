import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StackedBarChart extends StatefulWidget {
  @override
  _StackedBarChart createState() => _StackedBarChart();
}

class _StackedBarChart extends State<StackedBarChart> {
  final List<Map<String, dynamic>> account = [
    {
      "date": "2002.05.19",
      "cash": 950000,
      "stock": 150000,
    },
    {
      "date": "2002.05.20",
      "cash": 950000,
      "stock": 140000,
    },
    {
      "date": "2002.05.21",
      "cash": 850000,
      "stock": 160000,
    },
  ];

  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    super.initState();
    // 데이터를 _ChartData 형식으로 변환
    data = account.map((holding) {
      return _ChartData(holding['date'], holding['cash'].toDouble(), holding['stock'].toDouble());
    }).toList();
    _tooltip = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(),
          tooltipBehavior: _tooltip,
          series: <CartesianSeries>[
            StackedColumnSeries<_ChartData, String>(
              dataSource: data,
              xValueMapper: (data, _) => data.x,
              yValueMapper: (data, _) => data.y1,
              name: '예수금',
            ),
            StackedColumnSeries<_ChartData, String>(
              dataSource: data,
              xValueMapper: (data, _) => data.x,
              yValueMapper: (data, _) => data.y2,
              name: '주식',
            ),
          ],
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y1, this.y2);

  final String x;
  final double y1;
  final double y2;
}
