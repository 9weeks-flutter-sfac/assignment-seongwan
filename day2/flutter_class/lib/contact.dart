// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              ListTile(
                title: Text('이테디'), 
                subtitle: Text('010-1000-2000'),
                trailing: Icon(Icons.call),
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  // child: Image.network('https://picsum.photos/100/100'),  //child는 image를 자동으로 조정해주지 않는다.
                  backgroundImage: 
                    NetworkImage('https://picsum.photos/100/100'),  // backgroundImage는 ImageProvider 형태로 image를 불러온다. 
                ),
              ),
              ListTile(
                title: Text('김스틴'), 
                subtitle: Text('010-9000-8000'),
                leading: ClipOval(
                  child: Image.network('https://picsum.photos/100/100'),
                  ),
              ),
              ListTile(
                title: Text('이주노'), 
                subtitle: Text('010-3000-3000'),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network('https://picsum.photos/100/100'),
                ),
              ),
              ListTile(
                title: Text('임헬렌'), 
                subtitle: Text('010-2000-8000'),
                leading: Container(
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(99),
                    shape: BoxShape.circle,
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network('https://picsum.photos/100/100'), 
                ),
              ),
              ListTile(
                title: Text('염해리'), 
                subtitle: Text('010-1000-1000'),
              ),
              ListTile(
                title: Text('이테디'),
                subtitle: Text('010-1234-5678'),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://picsum.photos/100/100'),  //Image.asset
                  ),
                trailing: Icon(Icons.call),
              ),
              ListTile(
                title: Text('이테디'),
                subtitle: Text('010-1234-5678'),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://picsum.photos/100/100'),  //Image.asset
                  ),
                trailing: Icon(Icons.call),
              ),
              ListTile(
                title: Text('이테디'),
                subtitle: Text('010-1234-5678'),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://picsum.photos/100/100'),  //Image.asset
                  ),
                trailing: Icon(Icons.call),
              ),
              ListTile(
                title: Text('이테디'),
                subtitle: Text('010-1234-5678'),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://picsum.photos/100/100'),  //Image.asset
                  ),
                trailing: Icon(Icons.call),
              ),
              ListTile(
                title: Text('이테디'),
                subtitle: Text('010-1234-5678'),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://picsum.photos/100/100'),  //Image.asset
                  ),
                trailing: Icon(Icons.call),
              ),
              ListTile(
                title: Text('이테디'),
                subtitle: Text('010-1234-5678'),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://picsum.photos/100/100'),  //Image.asset
                  ),
                trailing: Icon(Icons.call),
              ),
            ],
          ),
        ),
      ),
    );
  }
}