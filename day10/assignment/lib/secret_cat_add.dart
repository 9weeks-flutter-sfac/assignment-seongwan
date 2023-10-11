import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () async {
                var secret = 
                  await SecretCatApi.addSecret('새로운 비밀입니다! 제 비밀이 궁금하신가요?');
                print(secret);
              }, 
              child: Text("비밀 업로드"),
            ),
            TextButton(
              onPressed: () async {
                var secrets = 
                  await SecretCatApi.fetchSecrets();
                print(secrets.last);
              }, 
              child: Text("비밀 확인"),
            ),
          ],
        ),
      )
    );
  }
}