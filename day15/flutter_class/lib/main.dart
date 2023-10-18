// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => Page2()));  // 기존 방식.
          Get.to(()=>Page2());  // Get에 의한 라우팅 방법
        }),
        body: Center(
          child: Text("Center")
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('내용 표시')));  // 기존 방법.
          // MediaQuery.of(context).size.width;  // 디바이스 가로 사이즈. 기존 방식.
          // MediaQuery.of(context).size.height;  // 디바이스 세로 사이즈. 기존 방식.
          Get.snackbar('내용 표시', '현재 디바이스 사이즈입니다. (${Get.width}/${Get.height}).');
        },
        label: Text("스낵바 출력"),
      ),
      body: Center(
        child: Text('Page2'),
      )
    );
  }
}
