import 'package:flutter/material.dart';
import 'package:stockly/widgets/holding_list.dart';
import 'package:stockly/widgets/holding_doughnut_chart.dart';

class Holdings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('보유 종목')),
      body: SafeArea(
        child: ListView(
          children: [
            // Doughnut 차트를 화면에 맞게 적절히 크기 조정
            Container(
              height: 250, // 차트의 높이를 설정
              child: HoldingDoughnutChart(),
            ),
            // HoldingList는 화면 크기에 맞게 확장
            HoldingList(),
          ],
        ),
      ),
    );
  }
}
