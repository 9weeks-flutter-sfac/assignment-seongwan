// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool sun = true;
  bool moon = true;
  bool star = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              ListTile(
                leading: sun
                    ? Icon(Icons.sunny)
                    : Icon(
                        Icons.sunny,
                        color: Colors.red,
                      ),
                title: Text('Sun'),
                trailing: IconButton(
                    icon: Icon(Icons.arrow_right_sharp),
                    onPressed: () {
                      sun = !sun;
                      setState(() {});
                    }),
              ),
              ListTile(
                leading: moon
                    ? Icon(Icons.question_mark_outlined)
                    : Icon(
                        Icons.question_mark_outlined,
                        color: Colors.green,
                      ),
                title: Text('Moon'),
                trailing: IconButton(
                    icon: Icon(Icons.arrow_right_sharp),
                    onPressed: () {
                      moon = !moon;
                      setState(() {});
                    }),
              ),
              ListTile(
                leading: star
                    ? Icon(Icons.star)
                    : Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                title: Text('Star'),
                trailing: IconButton(
                    icon: Icon(Icons.arrow_right_sharp),
                    onPressed: () {
                      star = !star;
                      setState(() {});
                    }),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '켜고 끄고 싶은 아이콘을 입력하세요.' 
                ),
                onSubmitted: (value) {
                  if (value == "sun")
                    sun = !sun;
                  else if (value == "moon")
                    moon = !moon;
                  else if (value == "star") 
                    star = !star;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              sun = true;
              moon = true;
              star = true;
              setState(() {});
            },
            child: Icon(Icons.refresh)),
      ),
    );
  }
}
