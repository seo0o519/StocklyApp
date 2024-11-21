import 'package:flutter/material.dart';

class Charge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child:
        GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child:
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFF6F7F9),
                ),
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(30),
                width: double.infinity,
                child:
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("계좌 충전", style: TextStyle(fontSize: 23)),
                        SizedBox(height: 10),
                        TextField(
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "충전할 금액을 입력하세요",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: UnderlineInputBorder( // 밑줄 테두리
                              borderSide: BorderSide(color: Colors.blue), // 밑줄 색상
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue), // 테두리 색상
                            ),
                            focusedBorder: UnderlineInputBorder( // 포커스 상태의 밑줄
                              borderSide: BorderSide(color: Colors.blue, width: 2),
                            ),
                          ),
                      ),
                        SizedBox(height: 20),
                        Text("충전 전 잔액 : 15,000,000")
                  ]
                )
              ),
              SizedBox(height: 10),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "충전하기",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3182F6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                    ),
                  ),
                ),
              )
            ]
          ),
        )
      )
    );
  }
}