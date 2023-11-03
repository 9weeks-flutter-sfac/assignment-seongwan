import 'package:flutter/material.dart';
import 'package:flutter_class/controller/auth_controller.dart';
import 'package:flutter_class/controller/login_controller.dart';
import 'package:flutter_class/controller/signup_controller.dart';
import 'package:flutter_class/util/pages.dart';
import 'package:get/get.dart';

import 'controller/secret_controller.dart';
import 'controller/upload_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SecretCat',
      theme: ThemeData(useMaterial3: true,),
      getPages: AppPages.pages,  // pages.dart
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());  // AuthController는 항상 시스템이 시작될 때마다 자동으로 호출되어야 한다.
        Get.lazyPut(() => LoginController());  // LoginController를 lazyPut으로 대기상태에 올려둔다.
        Get.put(() => SecretController(), permanent: true);  // GetView를 하면 페이지를 나올 때 Controller를 없앤다. 그걸 방지하고자 put으로 변경.
        Get.lazyPut(() => SignupController());
        // Get.lazyPut(() => UploadController());
        Get.put(UploadController(), permanent: true);  // Controller를 종료하지 않게 만든다.
      }),
      initialRoute: '/login',
    );
  }
}