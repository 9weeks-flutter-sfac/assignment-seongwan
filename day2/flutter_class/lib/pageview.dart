// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

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
        body: SafeArea(
          child: PageView(
            children: [
              Center(child: Text('1번페이지')),
              Center(child: Text('2번페이지')),
              Center(child: Text('3번페이지')),
            ],
          ),
        ),
      ),
    );
  }
}