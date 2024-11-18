import 'package:flutter/material.dart';
import '../widgets/chart_list_item.dart';
import '../widgets/bottom_navigation_bar.dart';

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
      body: SafeArea( // 상단바나 노치 영역을 피하도록 설정
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 왼쪽 정렬
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 5, left: 20, right: 20), // 상하좌우 각각 다르게 설정
              child: Text(
                "실시간 차트",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10), // 텍스트와 테이블 사이 간격 추가
            Expanded( // 테이블이 남은 공간을 차지하도록 설정
              child: StockTable(
                datas: [
                  {
                    'symbol': '000000',
                    'name': '삼성전자',
                    'close': 150.00,
                    'rate': 1.23,
                    'rate_price': 200.00,
                  },
                  {
                    'symbol': '010101',
                    'name': 'LG',
                    'close': 900.00,
                    'rate': -2.34,
                    'rate_price': -20.00,
                  },
                  {
                    'symbol': '011011',
                    'name': '기아',
                    'close': 900.00,
                    'rate': -2.34,
                    'rate_price': -20.00,
                  }
                ],
                gotoDetails: (symbol, name, close, rate, ratePrice) {
                  print('Navigating to details of $name');
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // 선택된 탭 변경
          });
        },
      ),
    );
  }
}



