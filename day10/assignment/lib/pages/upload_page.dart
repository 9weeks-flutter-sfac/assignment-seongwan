// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';

var backgroundImg = 
    'https://images.unsplash.com/photo-1481134803835-48d6de104072?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGNvenklMjBjYXR8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60';

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return Scaffold(  // Scaffold니까 페이지로서 다른 페이지로 이동할 수 있다.
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('뒤로 가기'),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(backgroundImg),
            fit: BoxFit.cover,  // 모든 영역에 이미지 채우기.
            colorFilter: ColorFilter.mode(
              Colors.black54, 
              BlendMode.darken,
            ) 
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
                minLines: 7,
                maxLines: 8,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white24,
                ),
              ),
              ElevatedButton(onPressed: () async {
                if (controller.text != '') {
                  var secret = await SecretCatApi.addSecret(controller.text);
                  if (secret != null) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("비밀 공유 성공! ${secret.secret}")));
                  }
                }
              }, 
              child: Text("업로드하기"))
            ],
          ),
        ),
      ),
    );
  }
}