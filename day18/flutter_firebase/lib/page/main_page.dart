import 'package:flutter/material.dart';
// import 'package:flutter_firebase/controller/auth_controller.dart';
import 'package:flutter_firebase/controller/main_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// class MainPage extends GetView<AuthController> {
class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/edit/profile'),
        child: const Icon(Icons.edit),  
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() => ListView(  // Obx로 바뀌는 값을 계속 감지해야 한다.
              // mainAxisAlignment: MainAxisAlignment.center,
              // children: [
              //   Text(controller.user.value!.uid),
              //   Text(controller.profile.value?.bloodtype ?? "null"),
              //   Text(controller.profile.value?.job ?? "null"),
              //   Text(controller.profile.value?.mbti ?? "null"),
              // ],
              children: [
                Row(
                  children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundImage: controller.user!.photoURL != null
                      ? NetworkImage(controller.user!.photoURL!)
                      : null,
                  ),
                  Expanded(
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('혈액형 ${controller.profile?.bloodtype ?? "null"}'),
                          Text('직업 ${controller.profile?.job ?? "null"}'),
                          Text('MBTI ${controller.profile?.mbti ?? "null"}'),
                        ]),
                    ))
                  ],
                ),
                ...controller.images.map((element) => Image.network(element)).toList(),
                TextButton(
                  onPressed: () async {
                    var picker = ImagePicker();  // image_picker 사용할 때는 권한이 설정되어 있는지 확인이 필요하다.
                    var res = await picker.pickImage(source: ImageSource.gallery);
                    if(res != null) {
                      controller.uploadImage(res);
                    }  // 이미지 업로드
                  },
                  child: Text("Upload"),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}