// ignore_for_file: prefer_const_constructors

import 'package:assignment/model/post.dart';
import 'package:assignment/widget/post_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Dio dio = Dio();

  Future<List<Post>>readData() async {  // List로 받기로 했는데 Map이 오니까 toList()
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var res = await dio.get(url);
    if(res.statusCode == 200) {
      var data = List<Map<String, dynamic>>.from(res.data);
      return data.map((e) => Post.fromMap(e)).toList();
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: readData(),  // readData를 실행하여 Future를 가져오고, 실행 결과를 snapshot을 통해서 보여준다.
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            // return Text(snapshot.data.toString());  // 데이터 확인.
            return ListView.separated(  // List<Post>이기에 ListView.builder 사용.
              itemCount: snapshot.data?.length ?? 0,  // 오류 방지. !을 사용하면 오류 발생 가능. null이면 0으로 설정.
              itemBuilder: (context, index) => 
                PostTile(post: snapshot.data![index]),
              separatorBuilder: (context, index) => 
                ((index+1) % 5) == 0  // 삼항연산자로 5마다 나뉘게 설정.
                ? Text('Post ${index + 2} ~ ${index + 5 + 1}',
                  style: TextStyle(fontSize: 36)
                  ) 
                : SizedBox(),
            );
          }
          return LinearProgressIndicator();
        },
      ),
    );
  }
}