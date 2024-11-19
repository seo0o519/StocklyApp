import 'package:flutter/material.dart';
import './widgets/bottom_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white, // 전체 배경색 흰색
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white, // 앱바 배경색 흰색
          elevation: 0, // 앱바 그림자 제거
          iconTheme: IconThemeData(color: Colors.black), // 앱바 아이콘 색상
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20), // 앱바 제목 색상 및 스타일
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white, // 하단 네비게이션 바 배경 흰색
          selectedItemColor: Colors.black, // 선택된 탭 아이콘 및 글자 색
          unselectedItemColor: Color(0xFFB4BDC6), // 선택되지 않은 탭 아이콘 및 글자 색
        ),
      ),
      initialRoute: '/',
      home: AppBottomNavigationBar(),
    );
  }
}
