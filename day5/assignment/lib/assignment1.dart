// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('5일차 과제'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 150),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FirstPage(),
                        ));
                  },
                  child: Text('1번 과제'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 150),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondPage(),
                        ));
                  },
                  child: Text('2번 과제'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ThirdPage(),
                        ));
                  },
                  child: Text('3번 과제'),
                ),
              ),
            ],
          ),
        ));
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List animalList = ['강아지', '고양이', '앵무새', '토끼', '오리', '거위', '원숭이'];
  @override
  Widget build(BuildContext context) {
    var scrollController = ScrollController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          scrollController.jumpTo(0);
        },
        child: Icon(Icons.vertical_align_top),
      ),
      appBar: AppBar(
        title: Text('5일차 과제'),
        centerTitle: true,
      ),
      body: ListView.builder(
        controller: scrollController,
        itemCount: animalList.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            height: 300,
            child: Text(animalList[index],
            ),
          );
        },
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

String mirroring = '';

class _ThirdPageState extends State<ThirdPage> {
  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('5일차 과제'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: textController,
            onChanged: (value) {
              mirroring = value;
              setState(() {});
            },
          ),
          Text(mirroring),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            textController.text = '';
            mirroring = '';
            setState(() {});
          },
          child: Icon(Icons.close)),
    );
  }
}