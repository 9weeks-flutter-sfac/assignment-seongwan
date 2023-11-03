import 'package:flutter/material.dart';
import 'package:flutter_class/controller/auth_controller.dart';
import 'package:get/get.dart';

class SettingPage extends GetView<AuthController> {
  const SettingPage({super.key});
  static const route = '/setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: Text(controller.profile!.username),  // profile에 null safety가 적용되므로 !가 필요하다.
            subtitle: Text(controller.profile!.name),
          ),
          ElevatedButton(
            onPressed: controller.logout,  // () => controller.logout() 형태로 입력해도 된다. 
            child: const Text("로그아웃"),
          ),
        ],
      ),
    );
  }
}