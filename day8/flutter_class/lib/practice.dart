// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var message = '';
  Future<String> getData() async {
    var dio = Dio();
    var res = await dio.get("https://sniperfactory.com/sfac/http_test");
    return res.data['result'];
  }

void handleonPress() async {
  message = await getData();
  setState((){});
} 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message),
              TextButton(
                onPressed: () {
                  handleonPress();
                }, 
                child: Text('데이터 가져오기'),
              ),
            ],
          )
        ),
      ),
    );
  }
}