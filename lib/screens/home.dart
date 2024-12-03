import 'package:flutter/material.dart';
import 'package:stockly/widgets/stock_table.dart';
import 'package:stockly/screens/alert_message.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  // 페이지 목록
  final List<Widget> _pages = [
    Center(child: Text('홈 화면')),
    Center(child: Text('검색 화면')),
    Center(child: Text('차트 화면')),
    Center(child: Text('설정 화면')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 왼쪽 정렬
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 5, left: 20, right: 20), // 상하좌우 각각 다르게 설정
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "실시간 차트",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(40, 40), // 원하는 정사각형 크기 설정
                      minimumSize: Size(40, 40), // 최소 크기를 동일하게 설정
                      shadowColor: Colors.transparent,
                      backgroundColor: Color(0xfff4f6fa),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),

                      ),
                      padding: EdgeInsets.zero, // 내부 여백 제거
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AlertMessage())
                      );
                    },
                    child: Icon(
                      Icons.notifications,
                      size: 25,
                      color: Color(0xfffadb14),
                    ),
                  ),
                ],
              )
            ),
            SizedBox(height: 10), // 텍스트와 테이블 사이 간격 추가
            Expanded( // 테이블이 남은 공간을 차지하도록 설정
              child: StockTable(),
            ),
          ],
        ),
      ),
    );
  }
}



