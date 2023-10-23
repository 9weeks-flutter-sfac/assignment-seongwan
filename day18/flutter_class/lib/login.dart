import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_class/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'page/login_page.dart';
import 'page/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // main()에 비동기 함수가 있을 때 필요한 부분이다.
  await Firebase.initializeApp(
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth
    .instance  // singleton 객체를 가져오기.
    .authStateChanges()  // authStateChanges() 인증이 바뀌는 것을
    .listen((user) {  // listen 계속 지켜보고 실행하겠다.
      if (user != null) {
        print(user.displayName);
        print(user.uid);  // user 고유 id
        print(user.email);
        // print(FirebaseAuth.instance.currentUser);
        // print("회원가입이 됐거나 유저가 들어왔다.");
        return;  // return으로 아예 끄기.
      }
      print("회원가입이나 로그인이 필요하다.");
    }); 
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const LoginPage(),
    );
  }
}
