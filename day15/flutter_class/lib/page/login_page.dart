import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/global_data_controller2.dart';
import '../model/user.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<GlobalDataController2>();
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            controller.user(User(id: '123', nickname: '1234'));
          },
          child: Text('로그인'),
        ),
      )
    );
  }
}