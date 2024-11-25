import 'package:flutter/material.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  final List<Map<String, dynamic>> holdings = [
    {
      "type": "buy",
      "name": "삼성전자",
      "date": "2024.11.23",
      "price": 54000,
      "quantity": 100,
      "status": "체결"
    },
    {
      "type": "sell",
      "name": "삼성전자",
      "date": "2023.11.10",
      "price": 58000,
      "quantity": 100,
      "status": "미체결"
    },
    {
      "type": "buy",
      "name": "삼성전자",
      "date": "2022.11.23",
      "price": 69000,
      "quantity": 100,
      "status": "체결"
    },
    {
      "type": "buy",
      "name": "LG",
      "date": "2021.10.31",
      "price": 72000,
      "quantity": 150,
      "status": "체결"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: holdings.length,
      itemBuilder: (context, index) {
        final data = holdings[index];
        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          color: Colors.white,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Chip(
                      label: Text(
                        data['type'] == 'buy' ? '매수' : '매도',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color : data['type']=='buy' ? Colors.red : Colors.blue),
                      ),
                      backgroundColor: data['type'] == 'buy'
                          ? Color(0xfffff6f6)
                          : Color(0xfff2f6ff),
                      shape: RoundedRectangleBorder(
                        side:BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                    Spacer(),
                    Text(
                      data['date'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  data['name'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${data['price']}원 X ${data['quantity']}주',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    Text(
                      '${data['price'] * data['quantity']} 원',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    data['status'],
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
