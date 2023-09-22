// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void _handleOnChanged(String value){
    print(value);
  }  // void는 생략이 가능하다.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: TextField(
          // onChanged: (value) {
          //   print(value);
          // },
          onChanged: _handleOnChanged,
          cursorColor: Colors.green,
          decoration: InputDecoration(
            label: Text("이메일 입력"),
            labelStyle: TextStyle(color: Colors.green),
            hintText: 'example@email.com',
            fillColor: Colors.black12,
            filled: true,  // 색상을 채운다.
          ),
        ),
      ),
    );
  }
}