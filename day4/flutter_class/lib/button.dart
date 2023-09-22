// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: (){}, 
              child: Text('안녕 난 text button'),
            ),
            // Icon(Icons.abc_sharp),
            ElevatedButton(
              onPressed: (){}, 
              child: Text('안녕~'),
            ),
            OutlinedButton(
              onPressed: (){}, 
              child: Text('안녕!')
            ),
            IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.abc_sharp)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {} 
          ),
      )
    );
  }
}