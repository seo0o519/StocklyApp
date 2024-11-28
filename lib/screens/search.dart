import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Map<String, dynamic>> companies = [
    {"name": '삼성전자', "symbol": '005930'},
    {"name": 'LG', "symbol": '003550'},
    {"name": 'SK하이닉스', "symbol": '000660'},
    {"name": '삼성바이오로직스', "symbol": '207940'},
    {"name": '기아', "symbol": '000270'},
  ];

  List<Map<String, dynamic>> filteredCompanies = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCompanies = companies; // 초기 상태는 전체 회사 리스트 표시
    searchController.addListener(() {
      filterCompanies();
    });
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
            .where((company) => company['name']
            .toLowerCase()
            .contains(query)) // 회사 이름에서 검색어 포함 여부 확인
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
            // 종목 리스트
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                itemCount: filteredCompanies.length,
                itemBuilder: (context, index) {
                  final data = filteredCompanies[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('${index + 1}',
                            style: TextStyle(color: Colors.blue, fontSize: 22)),
                        SizedBox(width: 15),
                        Text('${data['name']}',
                            style: TextStyle(color: Colors.black, fontSize: 20))
                      ],
                    ),
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
