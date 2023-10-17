// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dictionary App',
      theme: ThemeData.dark(),
      home: const MainPage(),      
    );
  }
}
