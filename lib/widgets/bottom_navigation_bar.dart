import 'package:flutter/material.dart';
import '../screens/home.dart';
import '../screens/search.dart';
import '../screens/my_invest.dart';
import '../screens/settings.dart';

class AppBottomNavigationBar extends StatefulWidget {
  @override
  _AppBottomNavigationBarState createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Home(),
    SearchScreen(),
    MyInvestScreen(),
    SettingsScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index; // 탭 인덱스 변경
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // 선택된 페이지를 표시
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // 현재 인덱스
        onTap: _onTabTapped, // 탭 선택 시 실행
        selectedItemColor: Colors.black, // 선택된 탭 아이콘 및 글자 색
        unselectedItemColor: Color(0xFFB4BDC6), // 선택되지 않은 탭 아이콘 및 글자 색
        type: BottomNavigationBarType.fixed, // 애니메이션 없애기
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size:30),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size:30),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart, size:30),
            label: '내 투자',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size:30),
            label: '설정',
          ),
        ],
      ),
    );
  }
}