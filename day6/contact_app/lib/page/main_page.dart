// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:contact_app/screen/contact_screen.dart';
import 'package:contact_app/screen/history_screen.dart';
import 'package:contact_app/screen/setting_screen.dart';
import 'package:contact_app/widget/ContactTile.dart';
import 'package:flutter/material.dart';

// CustomWidget

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var currentScreenIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('내 연락처'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ), 
        ],
      ),
      body: [
        ContactScreen(),
        HistoryScreen(),
        SettingScreen(),
      ][currentScreenIdx],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentScreenIdx,
        onTap: (value) {
          currentScreenIdx = value;
          setState(() {
            
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '연락처'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: '통화기록'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정'),
        ],
      )
    );
  }
}