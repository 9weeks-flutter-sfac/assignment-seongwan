// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_class/controller/global_data_controller2.dart';
import 'package:get/get.dart';

class MainPage3 extends StatelessWidget {
  const MainPage3({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<GlobalDataController2>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.user.value = null;  // Rxn을 사용할 때 null 설정 방법.
        }),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Hi!'),
        ],
      ),
      
    );
  }
}