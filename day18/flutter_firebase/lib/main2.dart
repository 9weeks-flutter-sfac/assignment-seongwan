import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_firebase/controller/login_controller.dart';
import 'package:flutter_firebase/firebase_options.dart';
import 'package:flutter_firebase/page/login_page2.dart';

import 'page/user_page.dart';

enum PageState {login, user}  // login 페이지와 user 페이지를 구분한다.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // 추가. 메인 함수에 비동기 함수가 있을 때 필요.
  await Firebase.initializeApp(  // firebase_options.dart에서 가져온 예시 코드.
   options: DefaultFirebaseOptions.currentPlatform,
 );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PageState pageState = PageState.login;

  _onAuthStateChanged(User? user) => setState(
    () => pageState = user != null ? PageState.user : PageState.login);

  _buildPage(state) {
    switch (state) {
      case PageState.login:
        return const LoginPage();
      case PageState.user:
        return UserPage(user: FirebaseAuth.instance.currentUser!);
    }
  }

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen(_onAuthStateChanged);
    FirebaseAuth.instance.userChanges().listen((event) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: _buildPage(pageState),
    );
  }
}