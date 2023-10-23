import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap:_handleOnTap,
              child: CircleAvatar(
                radius: 100,
                backgroundImage: 
                  user.photoURL != null ? NetworkImage(user.photoURL!) : null,
              ),
            ),
            const SizedBox(height: 16,),
            Text(user.displayName ?? 'No Name'),
            const SizedBox(height: 16,),
            ElevatedButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              child: const Text('로그아웃'),
            ),
          ],
        ),
      ),
    );
  }

  _handleOnTap() async {
    var picker = ImagePicker();
    var res = await picker.pickImage(source: ImageSource.gallery);
    if(res != null) {  // 1. ImagePicker를 켠다. 2. 이미지를 고른다. 3. Storage에 올린다. 4. getDownloadURL.
      // print(res.path);  // res.path는 디바이스 내에서의 경로. URL이 아니다.
      // storage에 올리기.
      var ref = FirebaseStorage.instance.ref('profile/${user.uid}');  // ref는 파일 경로.
      await ref.putFile(File(res.path));  // XFile을 File로 변환. putFile로 해당 경로에 파일 올리기. 파일은 imagepicker를 통해 얻은 이미지.
      // downloadURL 받기.
      var downloadURL = await ref.getDownloadURL();
      print(downloadURL);

      user.updatePhotoURL(res.path); // 이미지 URL(network Image)
      // main에 있는 initState에서 listen하고 있으므로 setState 없이도 화면이 갱신된다.
    }
  }
}