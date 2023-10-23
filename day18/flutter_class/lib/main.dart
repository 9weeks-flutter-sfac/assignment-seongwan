import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_class/firebase_options.dart';

import 'page/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // main()에 비동기 함수가 있을 때 필요한 부분이다.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}