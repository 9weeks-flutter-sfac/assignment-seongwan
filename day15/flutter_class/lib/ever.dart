import 'package:flutter/material.dart';
import 'package:flutter_class/controller/global_data_controller2.dart';
import 'package:flutter_class/model/user.dart';
import 'package:flutter_class/page/login_page.dart';
import 'package:flutter_class/page/main_page3.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(GlobalDataController2());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true),
      home: LoginPage() 
    );
  }
}