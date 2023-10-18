// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_class/page/main_page2.dart';
import 'package:get/get.dart';

import 'controller/global_data_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(GlobalDataController());
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      title: 'Flutter Demo',     
      home: MainPage2(),
    );
  }
}