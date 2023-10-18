import 'package:flutter/material.dart';
import 'package:flutter_class/controller/login_controller.dart';
import 'package:flutter_class/view/page/login_page.dart';

import 'controller/main_controller.dart';
import 'view/page/main_page.dart';
import 'package:get/get.dart';

import 'util/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        //  controller를 넣는다.
        // Get.put(LoginController());  // binding 방법1.
        Get.lazyPut(() => LoginController());
        Get.lazyPut(() => MainController());
      }),
      title: 'Flutter Demo',
      getPages: AppPages.pages, 
      //[
        // GetPage(name: LoginPage.route, page: () => LoginPage()),  // LoginPage.route가 login_page.dart에 정의되어 있다.
        // GetPage(name: '/main', page: () => MainPage()),
      // ],
      theme: ThemeData(useMaterial3: true,),
      home: const MainPage(),
      // home: const LoginPage(),  // pages.dart에서 GetPage가 생성될 때 binding을 통해 LoginPage가 put이 되므로 시점상 이 코드가 앞선다. 오류가 발생한다.
      // initialRoute: LoginPage.route,  // GetPage가 실행된 다음에 어떤 페이지로 갈 지 설정한다. 방법2.
    );
  }
}

