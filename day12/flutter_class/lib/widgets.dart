// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// 67강. 생활 Widget
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var currentOpacity = 1.0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('플러터 굉장하다.'),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          centerTitle: false,
          leading: Icon(Icons.people),
          elevation: 0,
          actions: [
            Icon(Icons.share),
          ],
        ),
        // body: Column(
        //   children: [
        //     Stack(
        //       children: [
        //         Container(
        //           color: Colors.red,
        //           width: 250,
        //           height: 250,
        //         ),
        //         Positioned(
        //           right: 0,
        //           bottom: 0,
        //           child: Container(
        //             color: Colors.blue.withOpacity(0.4),
        //             width: 200,
        //             height: 200,
        //           )
        //         )
        //       ]
        //     ),  // Stack widget 사용법
        //   ],
        // ),
        // body: ListView.separated(  // Divider 쓰는 법
        //   itemCount: 10,
        //   itemBuilder: (context, index) {
        //     return Text(index.toString());
        //   },
        //   separatorBuilder: (context, index) {
        //     if (index % 3 == 0) return Divider();  // 3개에 Divider 하나씩
        //     return SizedBox();
        //   },
        // )
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: 1,  // 0이면 안 보인다. 1이면 가장 진하게 보인다.
                duration: Duration(milliseconds: 300),
                child: GestureDetector(
                  onTap:() {
                    currentOpacity = currentOpacity == 0 ? 1 : 0;
                  },
                  child: Text(
                    "안녕하세요",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                  ),
                ),
              ),
              // AspectRatio(
              //   aspectRatio: 1/1,  // 1대1이라는 표시. 너비/높이
              //   child: AnimatedContainer(  // 속성값이 바뀌는 것에 맞춰서 변화.
              //     duration: Duration(microseconds: 300),
              //     width: 100,
              //     height: 300,
              //     color: Colors.red,
              //   ),
              // ),
              Wrap(
                spacing: 8,  // 간격 설정.
                children: [
                  Container(
                    color: Colors.red,
                    width: 40,
                    height: 40,
                  ),
                  Container(
                    color: Colors.orange,
                    width: 40,
                    height: 40,
                  ),
                  Container(
                    color: Colors.yellow,
                    width: 40,
                    height: 40,
                  ),
                  Container(
                    color: Colors.green,
                    width: 40,
                    height: 40,
                  ),
                  Container(
                    color: Colors.blue,
                    width: 40,
                    height: 40,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}