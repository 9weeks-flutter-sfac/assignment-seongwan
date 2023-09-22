// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: DefaultTextStyle(
          style: TextStyle(fontSize: 32, color: Colors.black),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    print("안녕하세요!");
                  },
                  child: Text('저도 이벤트 가질 수 있나요?')
                ),
                GestureDetector(
                  onTap: () {
                    print("안녕하세요"); // 터미널에 값이 출력된다.
                  },
                  child: Text('저도 이벤트 가질 수 있냐고요.'), 
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {} 
          ),
      )
    );
  }
}