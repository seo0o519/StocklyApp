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
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart, size: 30),
            label: '내 투자',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 30),
            label: '설정',
          ),
        ],
      ),
    );
  }
}