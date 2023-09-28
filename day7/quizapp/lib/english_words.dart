import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // nouns.take(50).forEach(print);
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('단어 보여주기'),
        // ),
        body: PageView.builder(
          itemCount: nouns.length,
          itemBuilder: (context, index) => Center(
            child: Text(
              // nouns.first,
              nouns[index],
              style: TextStyle(
                color: Colors.black87, 
                fontWeight: FontWeight.bold, 
                fontSize: 46
              ),
            ),
          ),
        ),
      ),
    );
  }
}