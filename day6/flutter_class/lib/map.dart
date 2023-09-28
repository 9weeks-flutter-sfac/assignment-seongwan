// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:flutter_class/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var myFriends = ['Teddy', 'Chris', 'Juno', 'Harry', 'Helen'];
    // var iterableMyFriends = myFriends.map((e) => null).toList();
    // iterableMyFriends.toList();
    // var categories = ['식품', '생활', '디지털', '뷰티', '패션', '자동차', '할인', '가구'];
    

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          // child: Center(
          //   child: Text('Teddy'),
          // ),
          // child: Row(
          // child: ListView(
          //   scrollDirection: Axis.horizontal,  // 오른쪽으로 스크롤 가능하게 한다.
          //   children: categories.map((e){
          //     // return Text(e);
          //     return Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Chip(label: Text(e)),
          //     );
          //     }
          //   ).toList()
          // ),
          child: Column(
            children: myFriends.map((e) {
              return ListTile(
                title: Text(e),
                subtitle: Text('동네친구 $e'),
                trailing: Icon(Icons.call),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}