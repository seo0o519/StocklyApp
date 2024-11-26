import 'package:flutter/material.dart';

class AlertMessageList extends StatefulWidget {
  @override
  _AlertMessageListState createState() => _AlertMessageListState();
}

class _AlertMessageListState extends State<AlertMessageList> {
  final List<Map<String, dynamic>> messages = [
    {
      "name": "삼성전자",
      "price": 65000,
      "date": "2002.05.19"
    },
    {
      "name": "삼성전자",
      "price": 65000,
      "date": "2002.05.19"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(5.0),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final data = messages[index];
        return Container(
          width: double.infinity, // 너비를 부모에 맞춤
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 0.2,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${data['name']} (이)가 ${data['price']}원에 도달했어요',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8), // 간격 추가
                Text(
                  '${data['date']}',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
