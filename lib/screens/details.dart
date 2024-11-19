// lib/screens/details.dart
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
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
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal:5),
                  child: Text('$name', style: const TextStyle(fontSize: 23)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal:5),
                  child: Text('$symbol', style: const TextStyle(fontSize: 23, color: Color(0xFFB4BDC6))),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal:5),
                  child: Text('$close원', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal:5),
                  child:
                    Text(
                      '$ratePrice원 ($rate%)',
                      style: TextStyle(
                        fontSize: 18,
                        color: (ratePrice > 0 ? Colors.red : Colors.blue),
                      ),
                    ),
                )

              ],
            ),
          ],
        ),
      ),
    );
  }
}

