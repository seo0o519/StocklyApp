import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  // TextEditingController를 사용하여 각 입력 필드 값 관리
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("안녕하세요!", style: TextStyle(fontSize: 24, height:1.1)),
                          Text("로그인을 진행해주세요.", style: TextStyle(fontSize: 24, height:1.1)),
                        ],
                      )
                  ),

                  SizedBox(height:20),
                  // 이름 입력 필드
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child:
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            // 이메일 입력 필드
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder( // 밑줄 테두리
                                  borderSide: BorderSide(color: Color(0xff3182F6)), // 밑줄 색상
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff3182F6)), // 테두리 색상
                                ),
                                focusedBorder: UnderlineInputBorder( // 포커스 상태의 밑줄
                                  borderSide: BorderSide(color: Color(0xff3182F6), width: 2),
                                ),
                                labelText: '이메일',
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "이메일을 입력하세요";
                                }
                                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                                  return "유효한 이메일 주소를 입력하세요";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16),

                            // 비밀번호 입력 필드
                            TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder( // 밑줄 테두리
                                  borderSide: BorderSide(color: Color(0xff3182F6)), // 밑줄 색상
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff3182F6)), // 테두리 색상
                                ),
                                focusedBorder: UnderlineInputBorder( // 포커스 상태의 밑줄
                                  borderSide: BorderSide(color: Color(0xff3182F6), width: 2),
                                ),
                                labelText: '비밀번호',
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "비밀번호를 입력하세요";
                                }
                                if (value.length < 6) {
                                  return "비밀번호는 최소 6자 이상이어야 합니다";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 24),
                          ]
                      )
                  ),

                  Spacer(),
                  // 로그인 버튼
                  Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // 유효성 검사 통과 시 실행할 코드
                                print("이메일: ${_emailController.text}");
                                print("비밀번호: ${_passwordController.text}");
                              }
                            },
                            child: Text(
                              "로그인",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color:Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF3182F6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
