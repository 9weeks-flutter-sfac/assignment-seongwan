// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';

var backgroundImg = 
    'https://images.unsplash.com/photo-1481134803835-48d6de104072?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGNvenklMjBjYXR8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60';

class SecretPage extends StatelessWidget {
  const SecretPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: FutureBuilder(
          future: SecretCatApi.fetchSecrets(),
          builder: (context, snapshot){
            if (snapshot.hasData) {
              var reversedList = snapshot.data!.reversed.toList();  // 역순. List는 reversed와 자주 쓰인다. Iterable이기에 toList()를 썼다.
              return PageView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return FadeInRight(
                    duration: Duration(milliseconds: 200),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 64,
                          backgroundColor: Colors.white38,
                          backgroundImage: AssetImage('assets/images/character.png'),
                        ),
                        SizedBox(height: 24,),
                        Text(
                          reversedList[index].secret,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text(
                          reversedList[index].author?.username ?? "익명",  // null일 때 "익명"
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          }
        ),
      ),
    );
  }
}