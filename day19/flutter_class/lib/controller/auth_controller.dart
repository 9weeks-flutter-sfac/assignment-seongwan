// ignore_for_file: unused_element

import 'package:flutter_class/model/profile.dart';
import 'package:flutter_class/util/api_routes.dart';
import 'package:flutter_class/view/page/main_page.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class AuthController extends GetxController {
  final Rxn<Profile> _profile = Rxn<Profile>();  // _profile은 private.
  Dio dio = Dio();

  Profile? get profile => _profile.value;  // getter를 이용하여 private이었던 _profile을 profile로 이용할 수 있도록 한다. setting_page.dart에서 쓴다.

  login(String id, String pw) async {
    var res = await dio.post(ApiRoutes.login, data: {'identity': id, 'password': pw});  // ApiROutes에 login. login은 post로 요청한다.
    if(res.statusCode == 200) {
      // print(res.data);
      var data = Map<String, dynamic>.from(res.data['record']); 
      _profile(Profile.fromMap(data));
    }
  }

  signup(String email, String pw, String pw2, String username ) async {
    // password, passwordConfirm, email, username
    var res = await dio.post(ApiRoutes.signup, data: {
      'email': email,
      'password': pw,
      'passwordConfirm': pw2,
      'username': username,
    });
    // print(res);  // 데이터 확인.
    _profile(Profile.fromMap(res.data));
  }

  logout() {
    _profile.value = null;  // 로그인페이지로 이동하게 한다.
  }

  _handleOnProfileChanged(value) {  // 이동하려면 route를 각 페이지마다 등록해줘야 한다.
    if(value != null) {
      // 메인으로 이동
      Get.toNamed(MainPage.route);
      return;  // 함수 종료
    }
    // 로그인으로 이동
    Get.toNamed('/login');
    return;
  }

  @override
  void onInit() {  // _profile이 바뀔 때마다 새로운 페이지로 이동하게 한다.
    // TODO: implement onInit
    super.onInit();
    ever(_profile, _handleOnProfileChanged);
  }
}