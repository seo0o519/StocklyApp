import 'package:flutter/material.dart';

class AssetsChart extends StatefulWidget {
  @override
  _AssetsChartState createState() => _AssetsChartState();
}

class _AssetsChartState extends State<AssetsChart> {
  int assets = 99870200;
  int stock = 50000000;
  int cash = 49870200;

  @override
  Widget build(BuildContext context) {
    // 비율 계산
    double stockRatio = stock / assets;
    double cashRatio = cash / assets;

    // 화면 너비를 가져오기 위해 LayoutBuilder 사용
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start, // 왼쪽 끝 정렬
            children: [
              SizedBox(
                width: 45, // 고정된 넓이로 정렬
                child: Text("총 자산", style: TextStyle(fontSize: 12)),
              ),
              SizedBox(
                height: 10, // 색상 바의 높이
                width: MediaQuery.of(context).size.width * 0.4,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
              ),
              Spacer(), // Spacer로 남은 공간을 채워 오른쪽 텍스트를 끝으로 보냄
              Text('$assets원', style: TextStyle(fontSize: 12)),
            ],
          ),

          SizedBox(height: 10), // 행 간 간격 추가
          Row(
            mainAxisAlignment: MainAxisAlignment.start, // 왼쪽 끝 정렬
            children: [
              SizedBox(
                width: 45, // 고정된 넓이로 정렬
                child: Text("주식", style: TextStyle(fontSize: 12)),
              ),
              SizedBox(
                height: 10, // 색상 바의 높이
                width: MediaQuery.of(context).size.width * 0.4 * stockRatio,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
              ),
              Spacer(), // Spacer로 남은 공간을 채워 오른쪽 텍스트를 끝으로 보냄
              Text('$stock원', style: TextStyle(fontSize: 12)),
            ],
          ),
          SizedBox(height: 10), // 행 간 간격 추가
          Row(
            mainAxisAlignment: MainAxisAlignment.start, // 왼쪽 끝 정렬
            children: [
              SizedBox(
                width: 45, // 고정된 넓이로 정렬
                child: Text("주식", style: TextStyle(fontSize: 12)),
              ),
              SizedBox(
                height: 10, // 색상 바의 높이
                width: MediaQuery.of(context).size.width * 0.4 * cashRatio,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
              ),
              Spacer(), // Spacer로 남은 공간을 채워 오른쪽 텍스트를 끝으로 보냄
              Text('$stock원', style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
