import 'package:flutter/material.dart';
import 'package:stockly/widgets/alert_message_list.dart';

class AlertMessage extends StatefulWidget {

  @override
  _AlertMessageState createState() => _AlertMessageState();
}

class _AlertMessageState extends State<AlertMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("알림함")),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 10),
                Icon(Icons.notifications, color: Colors.yellow),
                SizedBox(width: 8),
                Text(
                  "알림 목록",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16), // 상단 Row와 리스트 간의 간격 추가
            Expanded( // Column의 남은 공간을 ListView에 할당
              child: AlertMessageList(),
            ),
          ],
        ),
      ),
    );
  }
}