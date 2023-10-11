// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/secret_cat_sdk.dart';

var backgroundImg = 
    'https://images.unsplash.com/photo-1481134803835-48d6de104072?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGNvenklMjBjYXR8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60';

class AuthorPage extends StatelessWidget {
  const AuthorPage({super.key});

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
          future: SecretCatApi.fetchAuthors(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done) {
              return GridView.builder(
                itemCount: snapshot.data?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3), 
                itemBuilder: (context, index) {
                  return ZoomIn(
                    delay: Duration(milliseconds: 200*index),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 48,
                          backgroundImage: NetworkImage(snapshot.data![index].avatar!),
                        ),
                        SizedBox(height: 8,),
                        Text(
                          snapshot.data![index].username,
                          style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  );
                },
              );
            }
            return SizedBox();
          }
        ),
      ),
    );
  }
}