// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_class/controller/app_global_data_controller.dart';
import 'package:flutter_class/page/memo_page.dart';
import 'package:flutter_class/page/user_page.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppGlobalDataController(  // 전역으로 사용할 수 있게 되었다.
      name: "Teddy", 
      age: 99, 
      memos: []
      ), tag: 'My Secret Controller');  // controller에 이름을 붙여준다. 
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${controller.name}님 / ${controller.age}세'
            ),
            TextButton(
              onPressed: () {
                Get.to(() => MemoPage());
              }, 
              child: Text("To MemoPage"),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => UserPage());
              }, 
              child: Text("To UserPage"),
            ),
            TextButton(
              onPressed: () {
                controller.memos.add('새로운 메모가 들어갑니다.');
              }, 
              child: Text("Add memo"),
            ),
          ]
        ),
      ),
    );
  }
}