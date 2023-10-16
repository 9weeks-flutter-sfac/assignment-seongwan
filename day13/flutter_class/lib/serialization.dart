import 'dart:convert';

import 'package:http/http.dart' as http;

class Album {
  int userId;
  int id;
  String title;

  // 생성자
  Album({required this.userId, required this.id, required this.title});

  // 이름 있는 생성자. factory, return 추가.
  factory Album.fromMap(Map<String, dynamic> map) {  // fromMap은 JSON serialization을 도와주는 생성자 함수
    return Album(
      userId: map['userId'], 
      id: map['id'], 
      title: map['title'],
    );
  }

  @override
  toString() => "Album($userId, $id, $title)";
}

void main() async {
  var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums1'));
  if (response.statusCode == 200) {
    print(response.body);
    var album = Album.fromMap(jsonDecode(response.body));
    print(album);  // toString을 생략해도 객체 자체를 보여줄 때는 자동으로 작동.
  }
}