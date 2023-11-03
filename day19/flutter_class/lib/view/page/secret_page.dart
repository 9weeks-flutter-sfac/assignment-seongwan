import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/secret_controller.dart';

class SecretPage extends GetView<SecretController> {
  const SecretPage({super.key});
  static const route = '/secret';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => PageView.builder(  // Obx로 lazyput으로 대기상태였던 컨트롤러를 생성.
        itemCount: controller.secrets.length,
        itemBuilder: (context, index) => 
          Center(child: Text(controller.secrets[index].secret)),  // 데이터를 제대로 받아오는지 확인.
        ),
      ),
    );
  }
}