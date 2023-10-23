// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/firebase_options.dart';
import 'package:get/get.dart';

import 'controller/auth_controller.dart';
import 'controller/login_controller.dart';
import 'controller/main_controller.dart';
import 'controller/profile_edit_controller.dart';
import 'page/login_page.dart';
import 'page/main_page.dart';
import 'page/profile_edit_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // 추가. 메인 함수에 비동기 함수가 있을 때 필요.
  await Firebase.initializeApp(  // firebase_options.dart에서 가져온 예시 코드.
   options: DefaultFirebaseOptions.currentPlatform,
 );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());  // 전역 컨트롤러. 어떤 페이지에서도 접근 가능.
        Get.lazyPut(() => LoginController());
        Get.lazyPut(() => ProfileEditController());
        Get.lazyPut(() => MainController());
      }),
      getPages: [
        GetPage(name: '/', page: () => const LoginPage()),
        GetPage(name: '/main', page: () => const MainPage()),
        GetPage(name: '/edit/profile', page: () => const ProfileEditPage()),
      ],
      initialRoute: '/',
    );
  }
}