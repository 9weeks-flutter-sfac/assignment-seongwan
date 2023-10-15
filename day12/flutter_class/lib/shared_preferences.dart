// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, annotate_overrides

// shared_preferences를 이용하면 앱 데이터를 사용할 수 있다.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp2());
}

class MyApp2 extends StatefulWidget {
  const MyApp2({super.key});

  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  int _counter = 0;
  SharedPreferences? prefs;  // null이 올 수 있으니 ?을 넣는다.

  @override
 void initState() {  // StatefulWidget이 시작할 때 단 한 번 실행되는 함수. 초기화 함수.
  super.initState();
  initPreferences();  // initState에서 await을 쓰면 안 되기 때문에 따로 initpreferences를 만들었다.
 }

 void initPreferences() async {
  prefs = await SharedPreferences.getInstance();  // 객체 생성
  if (prefs != null) {
    _counter = prefs!.getInt('_counter') ?? 0;  // 처음 실행할 때는 null일 것이기 때문에 0을 넣는다.
    setState(() {});
  }
 }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('플러터 굉장하군'),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          centerTitle: false,
          leading: Icon(Icons.people),
          elevation: 0,
          actions: [
            Icon(Icons.share),
          ],
        ),
        body: Center(
          child: Text(
            "$_counter",
            style: TextStyle(fontSize: 48),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() => _counter += 1);
            // print(_counter);
            if (prefs != null) {
              prefs!.setInt('_counter', _counter);
            }
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}