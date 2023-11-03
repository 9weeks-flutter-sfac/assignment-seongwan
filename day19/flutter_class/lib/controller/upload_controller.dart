import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_class/util/api_routes.dart';
import 'package:get/get.dart';

class UploadController extends GetxController{
  var inputController = TextEditingController();
  Dio dio = Dio();

  upload() async {
    if (inputController.text.isEmpty) return;  // 아무것도 안 쓰여 있을 때 버튼을 누르면 아무 동작도 안 되도록 처리.
    var res = await dio.post(ApiRoutes.upload, data: {
      'secret': inputController.text,
    });
    inputController.text = '';  // Controller 초기화.
    // print(res);  // 결과값 확인.
  }
}