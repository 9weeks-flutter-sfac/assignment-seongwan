// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:assignment/calculatorWidget.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Calculator(),
      ),
    );
  }
}