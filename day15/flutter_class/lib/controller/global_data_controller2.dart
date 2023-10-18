import 'package:flutter_class/page/main_page3.dart';
import 'package:get/get.dart';
import '../model/user.dart';
import '../page/login_page.dart';

class GlobalDataController2 extends GetxController {
  Rxn<User> user = Rxn();

  @override
  void onInit() {  // contoller가 실행되자마자 실행하는 함수.
    super.onInit();
    print("컨트롤러가 실행됨.");
    ever(user, (value) {
      print("에버가 실행됨.");
      if(value == null) {
        Get.to(()=>LoginPage());
        return;
      }
      Get.to(()=>MainPage3());
    });
  }

}