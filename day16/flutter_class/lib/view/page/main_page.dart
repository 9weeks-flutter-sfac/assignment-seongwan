import 'package:flutter/material.dart';
import 'package:flutter_class/controller/main_controller.dart';
import 'package:flutter_class/view/page/login_page.dart';
import 'package:flutter_class/util/routes.dart';
import 'package:get/get.dart';

import '../widget/app_logo.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});
  static const String route = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLogo(),
            const Text("Main Page"),
            TextButton(
              onPressed: controller.toLogin, 
              child: Text('로그인 페이지로 이동'),
            ),
            // TextButton(
            //   onPressed: () {
            //     // Get.toNamed(LoginPage.route);
            //     Get.offAndToNamed(AppRoutes.login);  // 페이지 이동 후 이전 페이지로 돌아오려고 해도 못 돌아오도록 종료. AppBar에 자동으로 생기는 leading도 없어진다.
            //   }, 
            //   child: Text('로그인으로 이동'))
          ]
        ),
      ),
    );
  }
}