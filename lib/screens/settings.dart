import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('설정')),
      body: Column(
        children: [
          // 유저 정보
          Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                  children:[
                    SvgPicture.asset('assets/user.svg', width:70, height:70),
                    SizedBox(width: 16),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("강서영", style: const TextStyle(fontSize: 20)),
                          Text("sykang@swrd.cc", style: const TextStyle(fontSize: 16, color:Color(0xFF8C8C8C))),
                        ]
                    ),
                  ]
              ),
            ),
          SizedBox(
            width: double.infinity,
            height: 20,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xFFF6F7F9),
              ),
            ),
          ),

          // 내 계좌 관리
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal:25),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Column의 텍스트를 왼쪽 정렬
                children:[
                  Text("내 계좌 관리", style: const TextStyle(fontSize: 22)),
                  SizedBox(height: 25),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // 왼쪽과 오른쪽 끝으로 배치
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("계좌 충전", style: const TextStyle(fontSize: 18)),
                        Icon(Icons.arrow_forward_ios, size:18),
                      ]
                  ),
                  SizedBox(height: 20),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // 왼쪽과 오른쪽 끝으로 배치
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("투자 기록 초기화", style: const TextStyle(fontSize: 18)),
                        Icon(Icons.arrow_forward_ios, size:18),
                      ]
                  ),
                ]
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 20,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xFFF6F7F9),
              ),
            ),
          ),

          // 계정 관리
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal:25),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Column의 텍스트를 왼쪽 정렬
                children:[
                  Text("계정 관리", style: const TextStyle(fontSize: 22)),
                  SizedBox(height: 25),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // 왼쪽과 오른쪽 끝으로 배치
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("로그아웃", style: const TextStyle(fontSize: 18)),
                        Icon(Icons.arrow_forward_ios, size:18),
                      ]
                  ),
                  SizedBox(height: 20),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // 왼쪽과 오른쪽 끝으로 배치
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("회원탈퇴", style: const TextStyle(fontSize: 18)),
                        Icon(Icons.arrow_forward_ios, size:18),
                      ]
                  ),
                ]
            ),
          ),
        ],
        )
      );
  }
}