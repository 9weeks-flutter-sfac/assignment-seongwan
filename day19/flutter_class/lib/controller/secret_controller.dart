import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../model/secret.dart';
import '../util/api_routes.dart';

class SecretController extends GetxController{
  final RxList<Secret> _secrets = <Secret>[].obs;
  Dio dio = Dio();

  List<Secret> get secrets => _secrets;  // secret_page.dart에서 사용할 수 있게 getter로 처리.

  fetchSecrets() async {
    // dio를 통해서 데이터를 가져오고 secrets에다가 넣기.
    var res = await dio.get(ApiRoutes.secrets);
    var items = List<Map<String, dynamic>>.from(res.data['items']);
    _secrets(items.map((e) => Secret.fromMap(e)).toList());
    // print(res);  // res의 데이터 형태를 파악.
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchSecrets();
  }
}