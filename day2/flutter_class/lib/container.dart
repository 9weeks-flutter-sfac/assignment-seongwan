import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            width: 300,
            height: 300,
            alignment: Alignment.center,  // Text 위치 정렬
            margin: EdgeInsets.all(8),  // Container 바깥
            padding: EdgeInsets.all(8),  // Container 안  // Padding 위젯이 따로 필요 없다.
            child: Text('이테디'),
            decoration: BoxDecoration(
              color: Colors.red,  // decoration 사용할 때는 color 설정을 decoration의 속성으로 정한다.
              border: Border.all(),
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.red,
                  Colors.blue,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  spreadRadius: 8,  // 얼마나 퍼지는지
                  offset: Offset(30, 30),  // 어디에 위치하는지
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}