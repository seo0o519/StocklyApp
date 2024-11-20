import 'package:flutter/material.dart';
import '../widgets/candle_chart.dart';
import '../widgets/order_book.dart';  // 호가 화면을 위한 위젯을 추가하세요.

class DetailsScreen extends StatefulWidget {
  final String symbol;
  final String name;
  final double close;
  final double rate;
  final double ratePrice;

  // 생성자에서 전달된 값을 받아옵니다.
  const DetailsScreen({
    Key? key,
    required this.symbol,
    required this.name,
    required this.close,
    required this.rate,
    required this.ratePrice,
  }) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  // 선택된 항목을 추적하는 변수
  int _selectedIndex = 0;  // 0: 차트, 1: 호가

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),  // widget을 통해 상위 클래스의 값에 접근
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                  child: Text(widget.name, style: const TextStyle(fontSize: 23)), // widget 사용
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                  child: Text(widget.symbol, style: const TextStyle(fontSize: 23, color: Color(0xFFB4BDC6))), // widget 사용
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                  child: Text('${widget.close}원', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)), // widget 사용
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                  child: Text(
                    '${widget.ratePrice}원 (${widget.rate}%)',
                    style: TextStyle(
                      fontSize: 18,
                      color: (widget.ratePrice > 0 ? Colors.red : Colors.blue), // widget 사용
                    ),
                  ),
                ),
              ],
            ),

            // 토글 버튼
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 50,
                  child:
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5), // 외부 padding
                    child: ToggleButtons(
                      isSelected: [_selectedIndex == 0, _selectedIndex == 1],
                      onPressed: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Text(
                            '차트',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Text(
                            '호가',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // 선택된 버튼에 따라 다르게 표시되는 자식 요소
            Expanded(
              child: _selectedIndex == 0
                  ? CandleChart()  // 차트 화면
                  : OrderBook(),  // 호가 화면, 이 위젯은 별도로 구현 필요
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
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
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
