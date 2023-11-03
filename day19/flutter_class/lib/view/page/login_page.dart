
import 'package:flutter/material.dart';
import 'package:flutter_class/controller/login_controller.dart';
import 'package:flutter_class/view/page/signup_page.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
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
                child: const Text('LOGIN'),
              ),
              TextButton(
                onPressed: () => Get.toNamed(SignupPage.route),  // Controller를 안 쓰고 바로 Get을 이용했는데 일관성이 깨지므로 좋은 행동이 아니다.
                child: Text('회원가입'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}