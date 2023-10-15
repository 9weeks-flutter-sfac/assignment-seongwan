// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_class/main_page.dart';

void main() {
  runApp(const KioskApp());
}

class KioskApp extends StatelessWidget {
  const KioskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainPage());
  }
}