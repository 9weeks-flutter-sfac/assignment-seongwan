// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var myFriends = ['Teddy', 'Chris', 'Juno', 'Harry', 'Helen'];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          // child: ListView(
          //   children: myFriends.map((e) => Text(e)).toList(),
          // ),
          child: ListView.builder(
            itemCount: myFriends.length,
            itemBuilder: (context, index) {
              return Text(myFriends[index]);
            }),
          // child: ListView.builder(
          //   itemCount: 10,
          //   itemBuilder: (context, index) {  // arrow function과 block body function 둘 다 많이 쓰인다.
          //   return Text(index.toString());
          // })
        ),
      ),
    );
  }
}