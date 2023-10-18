import 'package:auth_controller/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {  // GetView는 Get.put이 된 상태에서만 사용 가능.
  const LoginPage({super.key});
  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.idController,
            ),
            TextField(
              controller: controller.pwController,
            ),
            ElevatedButton(
              onPressed: controller.login, 
              child: const Text('Login'),
            )
          ],
        )
      )
    );
  }
}