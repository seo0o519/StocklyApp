import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:candlesticks/candlesticks.dart';
import 'package:http/http.dart' as http;

class CandleChart extends StatefulWidget {
  @override
  _CandleChartState createState() => _CandleChartState();
}

class _CandleChartState extends State<CandleChart> {
  List<Candle> _candles = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCandles();
  }

  Future<void> _fetchCandles() async {
    try {
      final uri = Uri.parse('http://localhost.stock-service/api/v1/stockDetails/historicalFilter?symbol=005930&interval=1d'); // 백엔드 API URL
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        print("데이터왔ㅇ여");

        // JSON 데이터를 Candle 객체 리스트로 변환
        final fetchedCandles = jsonData.map((item) {
          return Candle(
            date: DateTime.parse(item['date']),
            open: double.parse(item['open']),
            high: double.parse(item['high']),
            low: double.parse(item['low']),
            close: double.parse(item['close']),
            volume: double.parse(item['volume']),
          );
        }).toList();

        setState(() {
          _candles = fetchedCandles;
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to fetch candles: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching candles: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: _isLoading
          ? Center(child: CircularProgressIndicator()) // 로딩 중 표시
          : Candlesticks(
        candles: _candles,
      ),
    );
  }
}
