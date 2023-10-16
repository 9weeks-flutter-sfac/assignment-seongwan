// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({
    required this.userId, 
    required this.id, 
    required this.title, 
    required this.body
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      userId: map['userId'],
      id: map['id'],
      title: map['title'],
      body: map['body'],
    );
  }

  @override
  String toString() {
    return 'Post: $body | $title';
  }
}

Future<Post?> getData(int userId) async {
  Dio dio = Dio();
  var url = 'https://jsonplaceholder.typicode.com/post/$userId';
  var response = await dio.get(url);
  if (response.statusCode == 200) {
    return Post.fromMap(response.data);
  }
  return null;
}

Future<List<Post>> readData() async {  // 비동기(기다려야 하는) 함수이기 때문에 Future
  Dio dio = Dio();
  var url = 'https://jsonplaceholder.typicode.com/posts';
  var response = await dio.get(url);
  if (response.statusCode == 200) {
    var data = List<Map<String,dynamic>>.from(response.data);  // 데이터타입 확인 후 설정.
    return data.map((e) => Post.fromMap(e)).toList();
  }
  return [];  // List의 경우에는 ?를 사용하기보다 반환값에 빈 리스트를 넣어서 null을 해결한다.
}

void main() async {
  var res = await readData();
  print(res);
  print(res.length);
  // var userId = 3;
  // for (var i=1; i<10; i++) {
  //   var res = await getData(userId);
  //   if(res != null) {
  //     print(res.title);
  //   }
  // }  
}