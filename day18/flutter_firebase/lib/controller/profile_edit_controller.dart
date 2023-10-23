import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/controller/auth_controller.dart';
import 'package:get/get.dart';

class ProfileEditController extends GetxController {
  final RxnString mbti = RxnString();
  final RxnString job = RxnString();
  final RxnString bloodtype = RxnString();

  updateProfile() async {
    String uId = Get.find<AuthController>().user.value!.uid;
    await FirebaseFirestore.instance.collection('profile').doc(uId).update({
      'mbti': mbti.value,
      'job': job.value,
      'bloodtype': bloodtype.value,
    });
    Get.find<AuthController>().fetchProfile(uId);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var profile = Get.find<AuthController>().profile.value;
    if (profile != null) {
      mbti(profile.mbti);
      job(profile.job);
      bloodtype(profile.bloodtype);
    }
  }
}