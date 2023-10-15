// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_class/model/post.dart';
import 'package:flutter_class/widget/post_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Post post = Post(
    symbolImg: 'https://res.cloudinary.com/daily-now/image/upload/t_logo,f_auto/v1/logos/a72ffa136c354e808949997e664d7898',
    postUrl: 'https://flutterawesome.com/a-simple-pomodoro-app-written-in-flutter/',
    title: 'A simple Pomodoro App written in Flutter',
    createdAt: DateTime(2021, 2, 25),
    readTime: null,
    thumbnailImag: 'https://res.cloudinary.com/daily-now/image/uplad/f_auto,q_auto/v1/posts/87ca15d20d6759a5183ea70f90cd24e2',
    comments: [],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                PostCard(post: post),
                PostCard(post: post),
                PostCard(post: post),
                PostCard(post: post),
                PostCard(post: post),
                PostCard(post: post),
                PostCard(post: post),
                PostCard(post: post),
              ]
            ),
          )
        ),
      ),
    );
  }
}