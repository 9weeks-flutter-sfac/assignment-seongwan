// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:profile_app/model/profile.dart';
import 'package:profile_app/page/detail_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Dio dio = Dio();
  List<Profile> profiles = [];
  readUsers() async {
    var url = 'https://jsonplaceholder.typicode.com/users';
    dio.get(url).then((value) {  // value에는 Future에서 얻은 response가 있다. await 대신 then 사용.
      if (value.statusCode == 200) {
        // print(value.data.runtimeType);  // List<dynamic>으로 전달 받는다.
        var data = List<Map<String, dynamic>>.from(value.data);
        profiles = data.map((e) => Profile.fromMap(e)).toList();
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    super.initState();
    readUsers();
  }

  @override
  Widget build(BuildContext context) {
    // readUsers();
    return Scaffold(
      appBar: AppBar(
        title: Text('My Contacts'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) => FadeInRight(
          delay: Duration(milliseconds: 100 * index),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://xsgames.co/randomusers/assets/avatars/male/${profiles[index].id}.jpg'),
            ),
            title: Text(
              profiles[index].name,
            ),
            subtitle: Text(profiles[index].email),
            trailing: IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => DetailPage(profile: profiles[index])
                    ,
                  ),
                );
              },
            ),
          ),
        )
      )
    );
  }
}