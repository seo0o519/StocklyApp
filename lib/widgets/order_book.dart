import 'package:flutter/material.dart';

class OrderBook extends StatefulWidget {
  //final String symbol;

  //const OrderBook({Key? key, required this.symbol}) : super(key: key);
  const OrderBook({Key? key}) : super(key: key);

  @override
  _OrderBookState createState() => _OrderBookState();
}

class _OrderBookState extends State<OrderBook> {
  late List<double> askLengths;
  late List<double> bidLengths;
  late Map<String, dynamic> datas;

  @override
  void initState() {
    super.initState();
    // 데이터 초기화 (임의로 값 설정)
    datas = {
      'sell_volume_3': 200.0,
      'sell_volume_4': 180.0,
      'sell_volume_5': 150.0,
      'sell_volume_6': 120.0,
      'sell_volume_7': 100.0,
      'sell_volume_8': 80.0,
      'sell_volume_9': 60.0,
      'sell_volume_10': 20.0,
      'buy_volume_1': 250.0,
      'buy_volume_2': 230.0,
      'buy_volume_3': 210.0,
      'buy_volume_4': 190.0,
      'buy_volume_5': 170.0,
      'buy_volume_6': 150.0,
      'buy_volume_7': 130.0,
      'buy_volume_8': 20.0,
      'sell_price_3': 15000,
      'sell_price_4': 14900,
      'sell_price_5': 14800,
      'sell_price_6': 14700,
      'sell_price_7': 14600,
      'sell_price_8': 14500,
      'sell_price_9': 14400,
      'sell_price_10': 14300,
      'buy_price_1': 14200,
      'buy_price_2': 14100,
      'buy_price_3': 14000,
      'buy_price_4': 13900,
      'buy_price_5': 13800,
      'buy_price_6': 13700,
      'buy_price_7': 13600,
      'buy_price_8': 13500,
    };

    calculateLengths();
  }

  void calculateLengths() {
    List<double> sellVolumes = [
      datas['sell_volume_3'],
      datas['sell_volume_4'],
      datas['sell_volume_5'],
      datas['sell_volume_6'],
      datas['sell_volume_7'],
      datas['sell_volume_8'],
      datas['sell_volume_9'],
      datas['sell_volume_10'],
    ];
    List<double> buyVolumes = [
      datas['buy_volume_1'],
      datas['buy_volume_2'],
      datas['buy_volume_3'],
      datas['buy_volume_4'],
      datas['buy_volume_5'],
      datas['buy_volume_6'],
      datas['buy_volume_7'],
      datas['buy_volume_8'],
    ];

    double maxVolume = [...sellVolumes, ...buyVolumes].reduce((a, b) => a > b ? a : b);

    askLengths = sellVolumes.map((volume) => (volume / maxVolume) * 100).toList();
    bidLengths = buyVolumes.map((volume) => (volume / maxVolume) * 100).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                DataTable(
                  columnSpacing: 0, // 열 사이의 간격 제거 (필요에 따라 조정)
                  columns: [
                    DataColumn(
                      label: SizedBox(
                        width: 100, // 금액 열의 고정된 넓이
                        child: Text(
                          '금액 (원)',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 200, // 매도/매수수량 열의 고정된 넓이
                        child: Text(
                          '매도수량',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                  rows: List.generate(8, (index) {
                    return DataRow(
                      cells: [
                        DataCell(
                          SizedBox(
                            width: 100, // 고정된 넓이
                            child: Text(
                              '${datas['sell_price_${index + 3}']}'
                                  .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => ','),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataCell(
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Container(
                                height: 20,
                                width: 200, // 고정된 넓이
                                color: Colors.white, // 배경색 (기본 바)
                              ),
                              Container(
                                height: 20,
                                width: 200 * askLengths[index] / 100, // 비율에 따른 길이
                                color: Color(0xffd1ddff), // 비율 색상
                              ),
                              Positioned.fill(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${datas['sell_volume_${index + 3}']} 주',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        overflow: TextOverflow.visible,
                                      ),
                                      softWrap: false, // 줄바꿈 안 함
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                DataTable(
                  columnSpacing: 0, // 열 사이의 간격 제거 (필요에 따라 조정)
                  columns: [
                    DataColumn(
                      label: SizedBox(
                        width: 100, // 금액 열의 고정된 넓이
                        child: Text(
                          '금액 (원)',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 200, // 매도/매수수량 열의 고정된 넓이
                        child: Text(
                          '매수수량',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                  rows: List.generate(8, (index) {
                    return DataRow(
                      cells: [
                        DataCell(
                          SizedBox(
                            width: 100, // 고정된 넓이
                            child: Text(
                              '${datas['buy_price_${index + 1}']}'
                                  .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => ','),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataCell(
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Container(
                                height: 20,
                                width: 200, // 고정된 넓이
                                color: Colors.white, // 배경색 (기본 바)
                              ),
                              Container(
                                height: 20,
                                width: 200 * bidLengths[index] / 100, // 비율에 따른 길이
                                color: Color(0xffffdbdb), // 비율 색상
                              ),
                              Positioned.fill(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${datas['buy_volume_${index + 1}']} 주',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        overflow: TextOverflow.visible,
                                      ),
                                      softWrap: false, // 줄바꿈 안 함
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
