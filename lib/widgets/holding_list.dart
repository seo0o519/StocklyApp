import 'package:flutter/material.dart';
import 'package:stockly/screens/details.dart';

class HoldingList extends StatefulWidget {
  @override
  _HoldingListState createState() => _HoldingListState();
}

class _HoldingListState extends State<HoldingList> {
  final List<Map<String, dynamic>> holdings = [
    {
      "name": "삼성전자",
      "symbol": "005930",
      "buyPrice": 70000,
      "quantity": 10,
      "changeRate": 1.5,
      "changePrice": 1050,
    },
    {
      "name": "카카오",
      "symbol": "020202",
      "buyPrice": 55000,
      "quantity": 5,
      "changeRate": -0.8,
      "changePrice": -440,
    },
    {
      "name": "LG에너지솔루션",
      "symbol": "030303",
      "buyPrice": 400000,
      "quantity": 2,
      "changeRate": 2.1,
      "changePrice": 8400,
    }
  ];

  int? _highlightedIndex;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: holdings.asMap().entries.map((entry) {
          final index = entry.key;
          final holding = entry.value;
          final name = holding['name'];
          final quantity = holding['quantity'];
          final buyPrice = holding['buyPrice'];
          final changeRate = holding['changeRate'];
          final changePrice = holding['changePrice'];
          final symbol = holding['symbol'];

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    symbol: symbol,
                    name: name,
                    close: buyPrice.toDouble(),
                    rate: changeRate.toDouble(),
                    ratePrice: changePrice.toDouble(),
                  ),
                ),
              );
            },
            child: Container(
              color: _highlightedIndex == index ? Color(0xFFF2F4F6) : Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: TextStyle(fontSize: 20)),
                      Text("$quantity주"),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("${buyPrice * quantity}원", style: TextStyle(fontSize: 20)),
                      Text(
                        "${changePrice > 0 ? "+" : ""}$changePrice원 (${changeRate > 0 ? "+" : ""}${changeRate.toStringAsFixed(1)}%)",
                        style: TextStyle(color: changeRate > 0 ? Colors.red : Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
