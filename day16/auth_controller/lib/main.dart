import 'package:auth_controller/controller/auth_controller.dart';
import 'package:auth_controller/controller/login_controller.dart';
import 'package:auth_controller/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/main_controller.dart';
import 'view/main_page.dart';

// 103강 GetX AuthController

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true,),
      initialBinding: BindingsBuilder(() {  // 앱이 실행되자마자 AuthController가 put.
        Get.put(AuthController());
        Get.lazyPut(() => LoginController());
        Get.lazyPut(() => MainController());
      }),  
      getPages: [
        GetPage(name: LoginPage.route, page: () => const LoginPage()),
        GetPage(name: MainPage.route, page: () => const MainPage()),
      ],
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () => Get.toNamed(LoginPage.route),
            child: Text('Hello World')
          ),
        ),
      ),
    );
  }
}
