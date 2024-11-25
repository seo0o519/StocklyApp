import 'package:flutter/material.dart';
import 'package:stockly/widgets/order_list.dart';

class OrderHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('주문 내역'), backgroundColor: Color(0xFFF6F7F9)),
      backgroundColor: Color(0xFFF6F7F9),
      body: SafeArea(
        child: Column(
          children: [
            Expanded( // 화면 전체에 적응하도록 수정
              child: OrderList(),
            ),
          ],
        ),
      ),
    );
  }
}
