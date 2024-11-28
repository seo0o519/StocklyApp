import 'package:flutter/material.dart';
import 'package:stockly/widgets/alert_request_list.dart';

class AlertRequest extends StatefulWidget {

  @override
  _AlertRequestState createState() => _AlertRequestState();
}

  class _AlertRequestState extends State<AlertRequest>{
  final hasData = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('알림 신청 내역'), backgroundColor: Color(0xFFF6F7F9)),
      backgroundColor: Color(0xFFF6F7F9),
      body: SafeArea(
        child: Column(
          children: [
            Expanded( // Column의 남은 공간을 ListView에 할당
                child: hasData
                    ? AlertRequestList()
                    : Center(
                    child: Text("알림 신청 내역이 없어요. ", style: TextStyle(color: Colors.black),)
                )
            ),
          ],
        ),
      ),
    );
  }
}
