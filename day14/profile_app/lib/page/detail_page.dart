// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../model/profile.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.profile});
  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(profile.name),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(  // 위젯이 겹쳐 보여야 하기 때문에 사용한다.
            clipBehavior: Clip.none,  // 빠져나온 부분을 자르지 않는다.
            children: [
              Image.network(
                'https://xsgames.co/randomusers/assets/avatars/male/${profile.id}.jpg',
                fit: BoxFit.cover,
                width: double.infinity,  // 너비로 화면 가득 차도록 만든다.
                height: 320,
                colorBlendMode: BlendMode.darken,  // 이미지 어둡게 하기. color를 따로 설정해야 한다.
                color: Colors.black45,
              ),
              Positioned(
                bottom: -48,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: CircleAvatar(
                    radius: 48,
                    backgroundImage: NetworkImage('https://xsgames.co/randomusers/assets/avatars/male/${profile.id}.jpg'),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 56,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.name,
                  style: TextStyle(fontSize: 32),
                ),
                Divider(),
                Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(width: 16,),
                    Text(
                      profile.phone,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),                
                Row(
                  children: [
                    Icon(Icons.map),
                    Text(
                      profile.address.street,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.email),
                    Text(
                      profile.email,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}