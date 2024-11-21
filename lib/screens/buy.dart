import 'package:flutter/material.dart';

class Buy extends StatelessWidget {
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

                    // 구매할 가격
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFF6F7F9),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20, // 가로 마진
                          vertical: 5,   // 세로 마진
                        ),
                        padding: const EdgeInsets.all(30),
                        width: double.infinity,
                        child:
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("구매할 가격", style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700)),
                              SizedBox(height: 10),
                              TextField(
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "구매할 가격을 입력하세요",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: UnderlineInputBorder( // 밑줄 테두리
                                    borderSide: BorderSide(color: Colors.grey), // 밑줄 색상
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey), // 테두리 색상
                                  ),
                                  focusedBorder: UnderlineInputBorder( // 포커스 상태의 밑줄
                                    borderSide: BorderSide(color: Colors.grey, width: 2),
                                  ),
                                ),
                              ),
                            ]
                        )
                    ),

                    // 수량
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFF6F7F9),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20, // 가로 마진
                          vertical: 5,   // 세로 마진
                        ),
                        padding: const EdgeInsets.all(30),
                        width: double.infinity,
                        child:
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("수량", style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700)),
                              SizedBox(height: 10),
                              TextField(
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "몇 주 구매할까요?",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: UnderlineInputBorder( // 밑줄 테두리
                                    borderSide: BorderSide(color: Colors.grey), // 밑줄 색상
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey), // 테두리 색상
                                  ),
                                  focusedBorder: UnderlineInputBorder( // 포커스 상태의 밑줄
                                    borderSide: BorderSide(color: Colors.grey, width: 2),
                                  ),
                                ),
                              ),
                              SizedBox(height:20),
                              Text("구매 가능 0원  |  최대 0주", style: TextStyle(fontSize: 15, color: Colors.black)),
                            ]
                        )
                    ),
                    Spacer(),

                    // 구매 버튼
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "구매하기",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFF25050),
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