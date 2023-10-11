// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:assignment/pages/author_page.dart';
import 'package:assignment/pages/secret_page.dart';
import 'package:assignment/pages/upload_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(  // Scaffold니까 페이지로서 다른 페이지로 이동할 수 있다.
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 64,
                backgroundColor: Colors.white38,
                backgroundImage: AssetImage('assets/images/character.png'),
              ),
              SizedBox(height: 8,),
              Text(
                "비밀 듣는 고양이", 
                style: TextStyle(color: Colors.white, fontSize: 34),
              ),
              SizedBox(height: 36,),
              ListTile(
                tileColor: Colors.white,
                title: Text('비밀 보기'),
                subtitle: Text('놀러가기'),
                onTap: () {  // 눌렀을 때 새로운 페이지로 이동. context는 현재 상태.
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => SecretPage())
                  );
                },
                trailing:  CircleAvatar(
                  backgroundColor: Colors.white38,
                  backgroundImage: AssetImage('assets/images/character.png'),
                ),
              ),
              SizedBox(height: 24,),
              ListTile(
                tileColor: Colors.white,
                title: Text('작성자들 보기'),
                subtitle: Text('놀러가기'),
                onTap: () {  // 눌렀을 때 새로운 페이지로 이동. context는 현재 상태.
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => AuthorPage())
                  );
                },
                trailing:  CircleAvatar(
                  backgroundColor: Colors.white38,
                  backgroundImage: AssetImage('assets/images/character.png'),
                ),
              ),
              SizedBox(height: 24,),
              ListTile(
                tileColor: Colors.white,
                title: Text('비밀 남기기'),
                subtitle: Text('놀러가기'),
                onTap: () {  // 눌렀을 때 새로운 페이지로 이동. context는 현재 상태.
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => UploadPage())
                  );
                },
                trailing:  CircleAvatar(
                  backgroundColor: Colors.white38,
                  backgroundImage: AssetImage('assets/images/character.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}