import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:stockly/screens/details.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Map<String, dynamic>> companies = [];
  List<Map<String, dynamic>> filteredCompanies = [];
  final TextEditingController searchController = TextEditingController();
  bool isLoading = true; // 데이터 로딩 상태

  @override
  void initState() {
    super.initState();
    fetchCompanies(); // 초기 데이터 로드
    searchController.addListener(() {
      filterCompanies();
    });
  }

  Future<void> fetchCompanies() async {
    try {
      final url = Uri.parse('http://localhost.stock-service/api/v1/stockDetails/symbols');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // UTF-8로 강제 디코딩
        final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));

        setState(() {
          companies = data.map((item) => {
            "name": item['name'],
            "symbol": item['symbol'],
            "close": item['close'],
            "rate" : item['rate'],
            "rate_price" : item['rate_price']
          }).toList();
          filteredCompanies = companies; // 초기 상태는 전체 회사 리스트
          isLoading = false; // 로딩 완료
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching companies: $e');
    }
  }


  void filterCompanies() {
    final query = searchController.text.toLowerCase();
    if (query.isEmpty) {
      setState(() {
        filteredCompanies = companies; // 검색어가 없으면 모든 회사 표시
      });
    } else {
      setState(() {
        filteredCompanies = companies
            .where((company) =>
            company['name'].toLowerCase().contains(query)) // 회사 이름에서 검색어 포함 여부 확인
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('검색')),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextField(
                controller: searchController,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "종목 검색",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Color(0xFFF6F7F9)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Color(0xFFF6F7F9)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Color(0xFFF6F7F9)),
                  ),
                  fillColor: Color(0xFFF6F7F9),
                  filled: true,
                  prefixIcon: Icon(Icons.search, color: Colors.blue),
                ),
              ),
            ),
            // 로딩 상태 확인
            if (isLoading)
              Center(
                child: CircularProgressIndicator(),
              )
            else
            // 종목 리스트
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  itemCount: filteredCompanies.length,
                  itemBuilder: (context, index) {
                    final data = filteredCompanies[index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(symbol: data['symbol'], name: data['name'], close: (data['close'] as num).toDouble(), rate: data['rate'], ratePrice: (data['rate_price'] as num).toDouble()),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${index + 1}',
                                style: TextStyle(color: Colors.blue, fontSize: 22)),
                            SizedBox(width: 15),
                            Flexible(
                              child: Text(
                                '${data['name']}',
                                style: TextStyle(color: Colors.black, fontSize: 20),
                                softWrap: true,
                                overflow: TextOverflow.visible,),
                            )
                          ],
                        ),
                      )
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
