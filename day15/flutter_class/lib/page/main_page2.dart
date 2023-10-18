// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_class/controller/global_data_controller.dart';
import 'package:get/get.dart';

class MainPage2 extends StatelessWidget {
  const MainPage2({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<GlobalDataController>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text(controller.myName.value)),
            Obx(() => Text(controller.myLevel.value.toString())),  // setState가 되도록 만든다.
            ElevatedButton(
              onPressed: () {
                controller.myLevel(controller.myLevel.value + 1);
                print(controller.myLevel);
              }, 
              child: const Text('+1'),
            ),
            ElevatedButton(
              onPressed: () {
                // controller.myName = 'TeddyGod'.obs;  // 새로운 데이터를 보여주지 못 하기 때문에 함수형으로 쓰는 게 낫다.
                controller.myName('Teddy');
              }, 
              child: const Text('이름 변경'),
            ),
          ]
        ),
      ),
    );
  }
}