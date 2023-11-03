import 'package:flutter/material.dart';
import 'package:flutter_class/controller/auth_controller.dart';
import 'package:get/get.dart';

import '../model/profile.dart';

class SignupController extends GetxController{
  var emailController = TextEditingController();
  var usernameController = TextEditingController();
  var pwController = TextEditingController();
  var pw2Controller = TextEditingController();

  signup() async {
    Get.find<AuthController>().signup(
      emailController.text,
      pwController.text,
      pw2Controller.text,
      usernameController.text  
    );
  }
}