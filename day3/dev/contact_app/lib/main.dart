// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:contact_app/contacttile.dart';
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
        appBar: AppBar(
          elevation: 0,
          title: Text('내 연락처'),
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.more_vert),
            ),
          ],
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text('이테디'),
              subtitle: Text('010-1000-2000'),
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://picsum.photos/100/100'),
              ),
              trailing: Icon(Icons.call),
            ),
            ContactTile(
              name: '크리스',
              phone: '010-2000-3000',
              imgUrl: 'http://picsum.photos/100/100',
            ),
            ContactTile(
              name: '우디',
              phone: '010-2222-3333',
              imgUrl: 'http://picsum.photos/80/80',
            ),
            ContactTile(
              name: '밀리', 
              phone: '010-4444-5555', 
              imgUrl: 'http://picsum.photos/200/200',
            ),
            ListTile(
              title: Text('이테디'),
              subtitle: Text('010-1000-2000'),
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://picsum.photos/100/100'),
              ),
              trailing: Icon(Icons.call),
            ),
            ListTile(
              title: Text('이테디'),
              subtitle: Text('010-1000-2000'),
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://picsum.photos/100/100'),
              ),
              trailing: Icon(Icons.call),
            ),
            ListTile(
              title: Text('주노'),
              subtitle: Text('010-1000-2000'),
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://picsum.photos/70/70'),
              ),
              trailing: Icon(Icons.call),
            ),
            ListTile(
              title: Text('벨라'),
              subtitle: Text('010-1000-2000'),
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://picsum.photos/50/50'),
              ),
              trailing: Icon(Icons.call),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_phone),
              label: '연락처',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: '통화기록',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '설정',
            ),
          ],
        ),
      ),
    );
  }
}