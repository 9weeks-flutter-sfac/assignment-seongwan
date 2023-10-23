import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_firebase/controller/auth_controller.dart';
import 'package:get/get.dart';

import '../model/profile.dart';
import 'package:image_picker/image_picker.dart';

class MainController extends GetxController{
  final RxList images = [].obs;

  User? get user => Get.find<AuthController>().user.value;
  Profile? get profile => Get.find<AuthController>().profile.value;

  fetchImages() async {
    var ref = FirebaseStorage.instance.ref('/images/');  // firebase에 있을 폴더 이름. images/uid
    var res = await ref.listAll();
    images.clear();
    print(res);
    for (var item in res.items) {
      var url = await item.getDownloadURL();
      // print(url);
      images.add(url);
    }
  }

  uploadImage(XFile file) {
    // print(file);
    var ref = FirebaseStorage.instance.ref('/images/${file.name}');  // 어디에 파일을 넣을 것인지 경로 설정. /images/${user.uid}/${file.name}
    ref.putFile(File(file.path)).then((p0) {  // File 형식은 dart.io import가 필요하다. XFile을 File로 바꿔주기 위한 코드. 
      fetchImages();
    });  
  }
}