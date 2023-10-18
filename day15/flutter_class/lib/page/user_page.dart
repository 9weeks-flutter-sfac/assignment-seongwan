// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_class/controller/app_global_data_controller.dart';
import 'package:get/get.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AppGlobalDataController>(tag: 'My Secret Controller');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(controller.name),
            Text(controller.age.toString()),
            Text('현재 메모 수: ${controller.memos.length}'),
          ],
        )
      ),
    );
  }
}