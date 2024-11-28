import 'package:flutter/material.dart';
import 'package:stockly/widgets/holding_list.dart';
import 'package:stockly/widgets/holding_doughnut_chart.dart';
import 'package:stockly/screens/home.dart';

class Holdings extends StatefulWidget {

  @override _HoldingsState createState() => _HoldingsState();
}

class _HoldingsState extends State<Holdings>{
  final hasData = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('보유 주식')),
      body: SafeArea(
        child: hasData
            ? ListView(
          children: [
            // Doughnut 차트를 화면에 맞게 적절히 크기 조정
            Container(
              height: 250, // 차트의 높이를 설정
              child: HoldingDoughnutChart(),
            ),
            SizedBox(
              width: double.infinity,
              height: 20,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFFF6F7F9),
                ),
              ),
            ),
            SizedBox(height:24),
            HoldingList(),
          ],
        )
        : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 세로 정중앙 정렬
            crossAxisAlignment: CrossAxisAlignment.center, // 가로 정중앙 정렬
            children: [
              Text(
                "보유 주식이 없어요.",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              GestureDetector(
                onTap:(){
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => Home()),
                  // );
                },
                child: Text(
                  "실시간 주식 시세 둘러보러 가기",
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
