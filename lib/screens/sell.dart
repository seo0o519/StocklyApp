import 'package:flutter/material.dart';

class Sell extends StatefulWidget {
  final String symbol;
  final String name;

  const Sell({Key? key, required this.symbol, required this.name}) : super(key: key);

  @override
  _SellState createState() => _SellState();
}

class _SellState extends State<Sell>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.name),),
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
                              Text("판매할 가격", style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700)),
                              SizedBox(height: 10),
                              TextField(
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "판매할 가격을 입력하세요",
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
                                  hintText: "몇 주 판매할까요?",
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
                              Text("판매 가능 수량 0주", style: TextStyle(fontSize: 15, color: Colors.black)),
                            ]
                        )
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                overlayColor: Colors.grey.withOpacity(0.05),
                                side: BorderSide(color: Colors.grey.shade400, width: 0.5),
                              ),
                              child: Text(
                                "10%",
                                style: TextStyle(color: Colors.black, fontSize: 13),
                              ),
                            ),
                          ),
                          SizedBox(width:10),
                          Expanded(
                            flex: 1,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                overlayColor: Colors.grey.withOpacity(0.05),
                                side: BorderSide(color: Colors.grey.shade400, width: 0.5),
                              ),
                              child: Text(
                                "25%",
                                style: TextStyle(color: Colors.black, fontSize: 13),
                              ),
                            ),
                          ),
                          SizedBox(width:10),
                          Expanded(
                            flex: 1,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                overlayColor: Colors.grey.withOpacity(0.05),
                                side: BorderSide(color: Colors.grey.shade400, width: 0.5),
                              ),
                              child: Text(
                                "50%",
                                style: TextStyle(color: Colors.black, fontSize: 13),
                              ),
                            ),
                          ),
                          SizedBox(width:10),
                          Expanded(
                            flex: 1,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                overlayColor: Colors.grey.withOpacity(0.05),
                                side: BorderSide(color: Colors.grey.shade400, width: 0.5),
                              ),
                              child: Text(
                                "최대",
                                style: TextStyle(color: Colors.black, fontSize: 13),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                            "판매하기",
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