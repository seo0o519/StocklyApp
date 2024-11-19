import 'package:flutter/material.dart';
import 'package:stockly/screens/details.dart';

class StockTable extends StatelessWidget {
  final List<Map<String, dynamic>> datas;

  const StockTable({
    Key? key,
    required this.datas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 테이블 바디
        Expanded(
          child: ListView.builder(
            itemCount: datas.length,
            itemBuilder: (context, index) {
              final data = datas[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(symbol: data['symbol'], name: data['name'], close: (data['close'] as num).toDouble(), rate: data['rate'], ratePrice: (data['rate_price'] as num).toDouble()),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20), // vertical : my, horizontal : mx
                  child: Table(
                    columnWidths: const {
                      0: FractionColumnWidth(0.5),
                      1: FractionColumnWidth(0.4),
                    },
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal:10),
                                  child: Text(
                                    '${index + 1}',
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Text(data['name'], style: const TextStyle(fontSize: 23)),
                              ],
                            ),
                          ),
                          TableCell(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end, // 자식 요소를 오른쪽으로 정렬
                              children: [
                                Text(
                                    '${_formatCurrency((data['close'] as num).toDouble())}원',
                                    style: const TextStyle(fontSize: 22),
                                    textAlign: TextAlign.right,
                                ),
                                Text(
                                  '${_formatCurrency((data['rate_price'] as num).toDouble())}원 (${data['rate']}%)',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: (data['rate_price'] as num) > 0 ? Colors.red : Colors.blue,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }

  String _formatCurrency(double value) {
    return value.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
          (match) => ',',
    );
  }
}

// 테이블 헤더 셀
class _HeaderCell extends StatelessWidget {
  final String label;

  const _HeaderCell({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        textAlign: TextAlign.right,
      ),
    );
  }
}
