import 'package:flutter/material.dart';
import 'package:stockly/screens/login.dart';
import 'package:stockly/screens/signup.dart';

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center, // 가로 방향 가운데 정렬
          children: [
            Spacer(), // 위쪽 여유 공간 추가
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min, // 내부 요소에만 맞는 크기로 설정
                children: [
                  Image.asset('assets/main_logo.png', width: 98, height: 144),
                  SizedBox(height: 20),
                  Text(
                    "직접 투자하며 배우는 모의 투자 서비스",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "편리한 모의투자 기능과 수익률 분석까지,",
                    style: TextStyle(fontSize: 17, color: Colors.grey),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "STOCKLY로 시작해보세요.",
                    style: TextStyle(fontSize: 17, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Spacer(), // 하단 버튼과 텍스트 사이 여유 공간
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signup()),
                    );
                  },
                  child: Text(
                    "시작하기",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3182F6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Row에서 가운데 정렬
                children: [
                  Text("이미 계정이 있나요? "),
                  Text(
                    "로그인",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
