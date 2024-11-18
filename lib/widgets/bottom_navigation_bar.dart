import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final ValueChanged<int> onTap; // 탭 선택 시 실행할 함수
  final int currentIndex; // 현재 선택된 탭 인덱스

  const AppBottomNavigationBar({
    Key? key,
    required this.onTap,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Colors.black, // 선택된 탭의 아이콘 및 글자 색
      unselectedItemColor: Colors.grey, // 선택되지 않은 탭의 아이콘 및 글자 색
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '검색',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: '내 투자',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '설정',
        ),
      ],
    );
  }
}
