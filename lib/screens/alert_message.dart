import 'package:flutter/material.dart';
import 'package:stockly/widgets/alert_message_list.dart';

class AlertMessage extends StatefulWidget {

  @override
  _AlertMessageState createState() => _AlertMessageState();
}

class _AlertMessageState extends State<AlertMessage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("알림함")),
        body: SafeArea(
            child:
            AlertMessageList()
      )
    );
  }
}