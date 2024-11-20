import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('검색')),
      body:
        GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child:
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20), // 여기에 패딩 값 설정
                child:
                TextField(
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "종목 검색",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // 테두리 둥글게 설정
                      borderSide: BorderSide(color: Color(0xFFF6F7F9)), // 테두리 색상
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // 비활성화 상태에서 둥글게
                      borderSide: BorderSide(color: Color(0xFFF6F7F9)), // 테두리 색상
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // 포커스 상태에서 둥글게
                      borderSide: BorderSide(color: Color(0xFFF6F7F9)), // 포커스 상태에서 테두리 색상과 두께 설정
                    ),
                    fillColor: Color(0xFFF6F7F9), // 배경색 설정
                    filled: true, // 배경색 활성화
                    prefixIcon: Icon(Icons.search, color: Colors.blue), // 왼쪽에 검색 아이콘 추가
                  ),
                ),
              ),
            ]
          ),
        )
    );
  }
}