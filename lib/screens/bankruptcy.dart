import 'package:flutter/material.dart';

class Bankruptcy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child:
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "투자 기록 초기화 경고",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "투자 기록을 초기화하면 사용자의 모든 투자 기록과 자산 정보가 초기 상태로 돌아갑니다. "
                    "데이터가 영구 삭제되므로 기록을 다시 복구할 수 없습니다. 신중하게 고민 후 결정하시길 바랍니다.",
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              Spacer(), // 남은 공간을 채워 버튼을 아래로 밀어냄
              Row(
                children:[
                  Expanded(
                    child:
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          minimumSize: Size(double.infinity, 50)
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("취소", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                    ),
                  ),
                  SizedBox(width:8),
                  Expanded(
                    child:
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF3182F6),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        minimumSize: Size(double.infinity, 50)
                      ),
                      onPressed: () {
                        // 초기화 로직 추가
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("경고"),
                            content: Text("정말로 투자 기록을 초기화하시겠습니까?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // 다이얼로그 닫기
                                },
                                child: Text("취소", style: TextStyle(color: Colors.black)),
                              ),
                              TextButton(
                                onPressed: () {
                                  // 초기화 처리 로직 추가
                                  Navigator.pop(context); // 다이얼로그 닫기
                                  Navigator.pop(context); // 이전 화면으로 돌아가기
                                },
                                child: Text("확인", style: TextStyle(color: Colors.black)),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text("초기화", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
