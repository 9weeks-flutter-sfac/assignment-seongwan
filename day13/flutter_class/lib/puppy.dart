// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_class/page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Flutter Demo',
      home: MainPage()
    );
  }
}