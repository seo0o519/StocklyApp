import 'package:flutter/material.dart';
import 'package:stockly/widgets/assets_chart.dart';
import 'package:stockly/widgets/line_chart.dart';
import 'package:stockly/widgets/stacked_bar_chart.dart';
import 'package:stockly/screens/holdings.dart';
import 'package:stockly/widgets/line_chart.dart';

class Assets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('내 자산 ・ 수익률')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "총 자산",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        "9,987,200 원",
                        style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        "-749,835원(-10.3%)",
                        style: TextStyle(fontSize: 17, color: Colors.blue),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Holdings())
                      );
                    },
                    child: Text(
                      "보유 주식 보기",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        shadows: [],
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffeceeef),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        elevation: 0,
                    ),
                  ),
                ],
              )
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
            Padding(
                padding: const EdgeInsets.all(30),
                child: AssetsChart(),
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
            StackedBarChart(),
            SizedBox(
              width: double.infinity,
              height: 20,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFFF6F7F9),
                ),
              ),
            ),
            LineChart()
          ],
        ),
      ),
    );
  }
}
