import 'package:flutter/material.dart';

class AlertRequestList extends StatefulWidget {
  @override
  _AlertRequestListState createState() => _AlertRequestListState();
}

class _AlertRequestListState extends State<AlertRequestList> {
  final List<Map<String, dynamic>> alerts = [
    {
      "name": "삼성전자",
      "price": 54000,
    },
    {
      "name": "LG",
      "price": 72000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: alerts.length,
      itemBuilder: (context, index) {
        final data = alerts[index];
        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          color: Colors.white,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data['name'],
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${data['price'] } 원',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.delete, color: Color(0xffB4BDC6),),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
