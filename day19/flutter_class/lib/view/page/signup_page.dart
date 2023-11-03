import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/signup_controller.dart';


class SignupPage extends GetView<SignupController> {
  const SignupPage({super.key});
  static const route = '/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(controller: controller.emailController,),
          TextField(controller: controller.usernameController,),
          TextField(controller: controller.pwController,),
          TextField(controller: controller.pw2Controller,),
          ElevatedButton(
            onPressed: controller.signup, 
            child: Text('시작하기'),
          ),
        ],
      ),
    );
  }
}