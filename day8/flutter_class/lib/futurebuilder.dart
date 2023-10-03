// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

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
  var dio = Dio();
  // Future getData() {
  //   var url = 'https://sniperfactory.com/sfac/http_test';
  //   dio.get(url);
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('SNIPER FACTORY'),
              FutureBuilder(
                // future: Future.delayed(Duration(seconds: 3), () => "Hello!"), 
                future: dio.get('https://sniperfactory.com/sfac/http_test'),  // dio.get은 Future이다.
                builder: (context, snapshot) {
                  print('현재 스냅샷 정보: ${snapshot.connectionState}');
                  print('hasData 값: ${snapshot.hasData}');
                  // if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {  // 데이터가 있을 때
                    // 현재 futurebuilder의 상태가 끝났을 때
                    // return Text(snapshot.data!);  // snapshot이 ConnectionState.done일 때 String임을 확신할 수 있기 때문에 null로 적용되었고 !가 있다.
                    // return Text(snapshot.data?.data.toString() ?? "실패");  // snapshot.data가 response이기 때문에 data를 한 번 더 쓰고 String으로 만든다. response가 null이 아님을 확신할 수 없어서 ?를 추가한다.
                    return Text(snapshot.data!.data.toString());  // !는 data가 있다고 확신할 때 사용한다. 확신 못 하면 ?를 쓴다.
                  }
                  // return SizedBox();  // 빈 위젯을 보내주겠다.
                  // return Container(
                  //   width: 10,
                  //   height: 20,
                  //   color: Colors.red,
                  // );
                  // return CircularProgressIndicator();  // 로딩 위젯
                  return LinearProgressIndicator();  // 로딩 위젯. flutter_spinkit 패키지를 설치해서 사용할 수도 있다.
                },
              ),
            ],
          )
        ),
      ),
    );
  }
}