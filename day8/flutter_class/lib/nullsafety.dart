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
  // String? message = 'Hello';  // ?은 null safety
  Dio dio = Dio();
  String? message = '메세지 가져오기';
  // String? result = null;  // 1번 방법
  String result = "";

  void getData() async {
    result = "";  // 예외 처리 예시용
    setState(() {});
    try {
      var url = 'https://sniperfactory.com/sfac/http_randomly_null';
      var res = await dio.get(url);
      result = res.data['item']['name'];
      setState(() {});      
    } on DioError catch (e) {  // 수업 내용에서는 에러가 없다.
      // print('에러 발생 ${e.type}');
      // print(e);
      result = e.message!;  // 수업 내용에서는 !가 없다.
      // result = '에러가 발생했습니다.';
      setState(() {});
    } finally {
      setState(() {});
    }  // 예외 처리 예시용
    // print(res.data);
    // var item = res.data['item'];
    // print(item['name']);
    // print(item['description']);
    // print(item['image']);
    // print(item['price']);
    // result = item['name'];  // 1번
    // setState(() {});  // 1번
    // result = item['name'] != null ? item['name']: "데이터를 불러올 수 없습니다.";  // 삼항연산자 사용. 3번
    // result = item['name'] ?? "데이터를 불러올 수 없습니다.";  // ?? 사용.  // 4번
    // if (item["name"] != null) {  // 2번
    //   result = item["name"];
    // } else {
    //   result = "데이터를 불러올 수 없습니다.";
    // }
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
              // if(result != null) Text(result!), // 1번
              Text(result),
              TextButton(
                onPressed: () {
                  getData();
                }, 
                child: Text(message!),  // !으로 message가 String이 맞다고 확정한다. 
              ),
            ],
          )
        ),
      ),
    );
  }
}