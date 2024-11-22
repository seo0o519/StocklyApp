import 'package:flutter/material.dart';
import 'package:stockly/screens/assets.dart';
import 'package:stockly/screens/holdings.dart';
import 'package:stockly/screens/order_history.dart';
import 'package:stockly/widgets/assets_chart.dart';

class MyInvestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('내 투자'), backgroundColor: Color(0xFFF6F7F9)),

      backgroundColor: Color(0xFFF6F7F9),
      body: SafeArea(
        child:
          SingleChildScrollView(
            child:
            Column(
              children: [

                // 내 자산, 수익률
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20, // 가로 마진
                      vertical: 5,   // 세로 마진
                    ),
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    child:
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("내 자산 ・ 수익률", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Assets())
                                  );
                                },
                                child: Text("자세히 보기 >", style: TextStyle(fontSize: 13, color: Colors.grey)),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text("9,987,200 원", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                          Text("-749,835원(-10.3%)", style: TextStyle(fontSize:15, color:Colors.blue)),
                          AssetsChart(),
                        ]
                    )
                ),

                // 보유 종목
                GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Holdings())
                      );
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20, // 가로 마진
                          vertical: 5,   // 세로 마진
                        ),
                        padding: const EdgeInsets.all(20),
                        width: double.infinity,
                        child:
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("보유 종목", style: TextStyle(fontSize: 20)),
                                  Icon(Icons.arrow_forward_ios, size: 18),
                                ],
                              )
                            ]
                        )
                    ),
                ),

                // 주문 내역
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OrderHistory())
                    );
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20, // 가로 마진
                        vertical: 5,   // 세로 마진
                      ),
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      child:
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("주문 내역", style: TextStyle(fontSize: 20)),
                                Icon(Icons.arrow_forward_ios, size: 18),
                              ],
                            )
                          ]
                      )
                  ),
                ),
              ]
            ),
        )
      ),
    );
  }
}