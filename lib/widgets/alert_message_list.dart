import 'package:flutter/material.dart';
import 'package:stockly/widgets/alert_message_list.dart';

class AlertMessageList extends StatefulWidget {

  @override
  _AlertMessageListState createState() => _AlertMessageListState();
}

class _AlertMessageListState extends State<AlertMessageList>{
  final List<Map<String, dynamic>> messages = [
    {
      "name": "삼성전자",
      "price": 65000,
      "date" : "2002.05.19"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Text("hello")
        )
    );
  }
}