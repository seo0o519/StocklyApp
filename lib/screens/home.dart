import 'package:flutter/material.dart';
import '../widgets/chart_list_item.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('STOCKLY')),
      body: StockTable(
        datas: [
          {
            'symbol': '000000',
            'name': '삼성전자',
            'close': 150.00,
            'rate': 1.23,
            'rate_price': 200.00,
          },
          {
            'symbol': '010101',
            'name': 'LG',
            'close': 900.00,
            'rate': -2.34,
            'rate_price': -20.00,
          },
          {
            'symbol': '011011',
            'name': '기아',
            'close': 900.00,
            'rate': -2.34,
            'rate_price': -20.00,
          },
        ],
        gotoDetails: (symbol, name, close, rate, ratePrice) {
          print('Navigating to details of $name');
        },
      ),
    );
  }
}
