import 'package:flutter/material.dart';
import 'package:flutter_class/view/widget/app_logo.dart';
import 'package:get/get.dart';

import '../../controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {  //StatelessWidget 대신 삽입. controller명을 generic으로 넣음으로써 controller 사용이 가능해진다.
  const LoginPage({super.key});
  static const String route = '/login';  // 라우팅 정의

  @override
  Widget build(BuildContext context) {
    // var controller = Get.put(LoginController());  // main.dart로 이동. binding으로 대체.
    // var controller = Get.find<LoginController>();  // GetView<generic>으로 대체.
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppLogo(),
              TextField(
                controller: controller.idController,
                decoration: InputDecoration(
                  hintText: 'ID',
                ),
              ),
              TextField(
                controller: controller.pwController,
                decoration: const InputDecoration(
                  hintText: 'PW',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(onPressed: controller.login , child: Text('로그인'))
            ]
          ),
        ),
      ),
    );
  }
}