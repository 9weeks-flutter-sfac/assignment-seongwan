import 'package:flutter_class/controller/login_controller.dart';
import 'package:flutter_class/util/routes.dart';
import 'package:get/get.dart';

import '../view/page/login_page.dart';
import '../view/page/main_page.dart';

class AppPages {
  static final pages = [  // 런타임 때에 정의가 되어야 하기 때문에 final이다.
    GetPage(
      name: AppRoutes.login, 
      page: () => const LoginPage(),  // const를 사용하려면 요소값들이 const이어야 한다.
      // binding: BindingsBuilder(() {  // binding 방법2.
      //   Get.put(LoginController());  
      // })
    ),  
    GetPage(name: AppRoutes.main, page: () => const MainPage()),
  ]; 
}