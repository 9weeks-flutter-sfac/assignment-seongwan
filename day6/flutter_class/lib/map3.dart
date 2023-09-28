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
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('10개월간의 수학 점수'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: myFriends
                  .where((element) => element.length == 5)
                  .map((element) => Text(element))
                  .toList(), 
                )          
              ]
            ),
          ),
        ),
      ),
    );
  }
}