// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:assignment/OptionCard.dart';
import 'package:assignment/main_page.dart';
import 'package:flutter/material.dart';

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

