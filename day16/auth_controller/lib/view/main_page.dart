// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auth_controller/controller/auth_controller.dart';
import 'package:auth_controller/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});
  static const String route = '/main';

  @override
  Widget build(BuildContext context) {
    var user = Get.find<AuthController>().user!;  // .user로 하면 안된다. _user와 같이 private으로 설정되어 있기 때문이다. AuthController에서 getter를 이용해 재설정.
    return Scaffold(
      bottomNavigationBar: Obx(  // 실시간으로 바뀌는 값을 반영한다.
        () => BottomNavigationBar(
          currentIndex: controller.curPage.value,
          onTap: controller.onPageTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My'),
          ]
        ),
      ),
      body: SafeArea(
        child: PageView(  // 눌렀을 때 해당 페이지로 가야 해서 PageView.
          controller: controller.pageController,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.username}님 안녕하세요.',
                  style: TextStyle(fontSize: 32),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    // backgroundImage: NetworkImage(url),
                  ),
                  title: Text(user.username),
                  subtitle: Text(user.name),
                ),
                ListTile(
                  title: Text('로그아웃하기'),
                  leading: Icon(Icons.logout),
                  onTap: controller.logout,
                )
              ],
            ),
          ],
        )
      )
    );
  }
}