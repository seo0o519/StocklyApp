import 'package:flutter/material.dart';
import 'package:stockly/widgets/bottom_navigation_bar.dart';

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
        toggleButtonsTheme: ToggleButtonsThemeData(
          color: Color(0xFF3182F6), // 기본 색상
          selectedColor: Colors.white, // 선택된 버튼의 텍스트 색상
          selectedBorderColor: Color(0xFF3182F6), // 선택된 버튼의 테두리 색상
          borderColor: Colors.grey, // 비선택 버튼의 테두리 색상
          borderWidth: 0.5, // 테두리 두께
          fillColor: Color(0xFF3182F6), // 비선택 버튼의 배경 색상
          splashColor: Color(0xFF3182F6).withOpacity(0.1), // 클릭 시 물결 효과 색상
          hoverColor: Color(0xFF3182F6).withOpacity(0.1), // 마우스를 올렸을 때 색상
          focusColor: Color(0xFF3182F6), // 포커스 상태일 때 색상
          borderRadius: BorderRadius.circular(10)
        ),
        dialogTheme: DialogTheme(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
        )
      ),
      initialRoute: '/',
      home: AppBottomNavigationBar(),
    );
  }
}
