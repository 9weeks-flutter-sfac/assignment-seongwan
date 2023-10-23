import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/profile.dart';

class AuthController extends GetxController {  // AuthController의 목적은 사용자의 상태 정보 저장.
  final Rxn<User> user = Rxn<User>();  // 유저 정보 가져오기.
  final Rxn<Profile> profile = Rxn<Profile>();

  fetchProfile(String uId) async {  // Profile에 새로운 값 입력.
    var res = await FirebaseFirestore.instance.collection('profile').doc(uId).get();
    // print(res.data());
    var data = res.data()!;
    profile(Profile(mbti: data['mbti'], job: data['job'] , bloodtype: data['bloodtype']));
  }

  @override
  onInit() {
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((value) {
      user(value);
      if (value != null)  {
        // 유저가 있는 상태.
        // main or profile_edit
        fetchProfile(value.uid);
        Get.toNamed('main');
      } else {
        // 유저가 없는 상태.
        // login
        Get.toNamed('/');
      }
    });
  }

  login(id, pw) => FirebaseAuth.instance.signInWithEmailAndPassword(
    email: id, 
    password: pw
  );

  signUp(id, pw) => FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: id, 
    password: pw
  );

Future<UserCredential> signInWithGoogle() async {  // https://firebase.google.com/docs/auth/flutter/federated-auth?hl=co
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final OAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
}