import 'package:auth_controller/util/api_routes.dart';
import 'package:auth_controller/view/login_page.dart';
import 'package:auth_controller/view/main_page.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../model/user.dart';

class AuthController extends GetxController{
  final Rxn<User> _user = Rxn(); // _user라고 적은 이유: 다른 파일에서는 가져올 수 없도록 만들어야 한다.
  Dio dio = Dio();

  User? get user => _user.value;  // user가 항상 있을 것이라고 보장할 수 없기 때문에 null safety.

  login(String id, String pw) async {
    dio.options.baseUrl = 'http://52.79.115.43:8090';
    try {
      var res = await dio.post(
        ApiRoutes.authWithPassword,
        data: {
          'identity': id,
          'password': pw,
        }
        );
      print(res.realUri);
      if (res.statusCode == 200) {
        print(res.data['record']);
        var user = User.fromMap(res.data['record']);
        _user(user);  // Rxn() 즉, null 대신 새로운 값 입력.
      }      
    } on DioError catch (e) {
      print(e.message);
      print(e.requestOptions);
    }

  }

  logout() {
    _user.value = null;
  }

  _handleAuthChanged(User? data) {
    if (data != null) {
      // Get.to
      // 메인페이지로 이동
      Get.toNamed(MainPage.route);
      return;
    }
    // 로그인페이지로 이동
    Get.toNamed(LoginPage.route);
    return;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ever(_user, _handleAuthChanged);  // ever. 데이터가 바뀔 때마다 실행.
  }
}