// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var url = 'https://sniperfactory.com/sfac/http_only_json_data';
  var dio = Dio();

  void getDataUsingHttp () async {
    var res = await http.get(Uri.parse(url));  // get의 Future 때문에 await을 쓴다.
    print('Http: ${res.body.runtimeType}');  // 결과값이 instance이기 때문에 내용을 보여주기 위해 body를 사용한다.
  }

  void getDataUsingDio() async {
    // var res = await dio.get('https://sniperfactory.com/sfac/http_test');
    // var res = await dio.post('https://sniperfactory.com/sfac/http_only_post');
    var res = await dio.get(
      // 'https://sniperfactory.com/sfac/http_only_chrome_browser',
      // 'https://sniperfactory.com/sfac/http_only_jwt_included',
      // options: Options(
      //   headers: {
      //     'user-agent': 'Chrome',
      //     'authorization': 'Bearer ey- 123123',
      //   }
      // )
      url
    );
    print('Dio: ${res.data.runtimeType}');
    print(res.data['item']['name']);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  getDataUsingDio();
                },
                child: Text('getDataUsingDio'),
              ),
              TextButton(
                onPressed: () {
                  getDataUsingHttp();
                },
                child: Text('getDataUsingHttp'),
              ),
            ],
          )
        ),
      ),
    );
  }
}