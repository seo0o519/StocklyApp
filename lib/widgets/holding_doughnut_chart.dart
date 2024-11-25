import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HoldingDoughnutChart extends StatefulWidget {
  @override
  _HoldingDoughnutChartState createState() => _HoldingDoughnutChartState();
}

class _HoldingDoughnutChartState extends State<HoldingDoughnutChart> {
  final List<Map<String, dynamic>> holdings = [
    {
      "name": "삼성전자",
      "buyPrice": 70000,
      "quantity": 10,
      "changeRate": 1.5,
      "changePrice": 1050,
    },
    {
      "name": "카카오",
      "buyPrice": 55000,
      "quantity": 5,
      "changeRate": -0.8,
      "changePrice": -440,
    },
    {
      "name": "LG에너지솔루션",
      "buyPrice": 400000,
      "quantity": 2,
      "changeRate": 2.1,
      "changePrice": 8400,
    }
  ];

  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    super.initState();

    // 차트 데이터를 holdings 기반으로 생성
    data = holdings.map((holding) {
      final name = holding['name'];
      final totalValue = holding['buyPrice'] * holding['quantity'];
      return _ChartData(name, totalValue.toDouble());
    }).toList();

    _tooltip = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SfCircularChart(
        tooltipBehavior: _tooltip,
        series: <CircularSeries<_ChartData, String>>[
          DoughnutSeries<_ChartData, String>(
            dataSource: data,
            xValueMapper: (_ChartData data, _) => data.x,
            yValueMapper: (_ChartData data, _) => data.y,
            dataLabelSettings: const DataLabelSettings(isVisible: true),
            name: 'Holdings',
          )
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
