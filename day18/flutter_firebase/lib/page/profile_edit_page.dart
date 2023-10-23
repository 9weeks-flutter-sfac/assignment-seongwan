import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/profile_edit_controller.dart';

class ProfileEditPage extends GetView<ProfileEditController> {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Obx(  // Rx를 썼기 때문에 데이터가 바뀌는 것을 계속 캐치해야 한다.
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('프로필 수정 및 추가', style: Theme.of(context).textTheme.bodyLarge,),
                const SizedBox(height: 16,),
                DropdownButton(
                  value: controller.job.value,  // 초기값.
                  items: [
                    "개발자",
                    "디자이너",
                    "기획자",
                    "마케터",
                    "기타",
                  ].map((e) => DropdownMenuItem(value: e, child: Text(e),)).toList(), 
                  onChanged: controller.job,
                  hint: const Text('직업을 선택하세요.'),
                ),
                DropdownButton(
                  value: controller.bloodtype.value,
                  items: [
                    "A",
                    "B",
                    "AB",
                    "O",
                  ].map((e) => DropdownMenuItem(value: e, child: Text(e),)).toList(), 
                  onChanged: controller.bloodtype,
                  hint: const Text('혈액형을 선택하세요.'),
                ),
                DropdownButton(
                  value: controller.mbti.value,
                  items: [
                    "ISTJ",
                    "ISFJ",
                    "INFJ",
                    "INTJ",
                    "ISTP",
                    "ISFP",
                    "INFP",
                    "INTP",
                    "ESTP",
                    "ESFP",
                    "ENFP",
                    "ENTP",
                    "ESTJ",
                    "ESFJ",
                    "ENFJ",
                    "ENTJ",
                  ].map((e) => DropdownMenuItem(value: e, child: Text(e),)).toList(), 
                  onChanged: controller.job,
                  hint: const Text('MBTI를 선택하세요.'),
                ),
                TextButton(
                  onPressed: controller.updateProfile, 
                  child: const Text('적용하기'),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}