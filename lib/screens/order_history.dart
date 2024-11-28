import 'package:flutter/material.dart';
import 'package:stockly/widgets/order_list.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}
class _OrderHistoryState extends State<OrderHistory> {
  final hasData = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('주문 내역'), backgroundColor: Color(0xFFF6F7F9)),
      backgroundColor: Color(0xFFF6F7F9),
      body: SafeArea(
        child: Column(
          children: [
            Expanded( // 화면 전체에 적응하도록 수정
              child: hasData
                  ? OrderList()
                  : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // 세로 정중앙 정렬
                  crossAxisAlignment: CrossAxisAlignment.center, // 가로 정중앙 정렬
                  children: [
                    Text(
                      "주문 목록이 없어요.",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    GestureDetector(
                      onTap:(){
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => Home()),
                        // );
                      },
                      child: Text(
                        "실시간 주식 시세 둘러보러 가기",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
