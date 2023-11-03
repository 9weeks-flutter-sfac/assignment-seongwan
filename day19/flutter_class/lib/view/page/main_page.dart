import 'package:flutter/material.dart';
import 'package:flutter_class/view/page/secret_page.dart';
import 'package:flutter_class/view/page/setting_page.dart';
import 'package:flutter_class/view/page/upload_page.dart';
import 'package:get/get.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});
  static const route = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('비밀 듣는 고양이'),
          ListTile(
            title: const Text('비밀 보기'),
            onTap: () => Get.toNamed(SecretPage.route),
          ),
          ListTile(
            title: const Text('비밀 올리기'),
            onTap: () => Get.toNamed(UploadPage.route),
          ),
          ListTile(
            title: const Text('앱 설정'),
            onTap: () => Get.toNamed(SettingPage.route),
          )
        ],
      )
    );
  }
}