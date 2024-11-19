import 'package:flutter/material.dart';
import 'package:candlesticks/candlesticks.dart';

class CandleChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 예제 데이터
    final candles = List.generate(
      50, // 데이터 길이를 50개 이상으로 설정
          (index) => Candle(
        date: DateTime(2023, 11, 15).add(Duration(days: index)),
        open: 100.0 + index * 2,
        high: 110.0 + index * 2,
        low: 95.0 + index * 2,
        close: 105.0 + index * 2,
        volume: 5000 + index * 100,
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Candlesticks(
        candles: candles,
      ),
    );
  }
}
