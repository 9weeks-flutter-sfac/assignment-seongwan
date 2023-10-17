// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
// import 'dart:convert';

import 'package:dio/dio.dart';

class Todo {
  int useId;
  int id;
  String title;
  bool copleted;

  Todo({
    required this.useId,
    required this.id,
    required this.title,
    required this.copleted,
  });

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'useId': useId,
  //     'id': id,
  //     'title': title,
  //     'copleted': copleted,
  //   };
  // }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      useId: map['useId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      copleted: map['copleted'] as bool,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Todo(useId: $useId, id: $id, title: $title, copleted: $copleted)';
  }
}

Future<Todo?> getData(int todoNumber) async {
  Dio dio = Dio();
  var url = ' https://jsonplaceholder.typicode.com/todos/$todoNumber';
  var res = await dio.get(url);
  if (res.statusCode == 200) {
    return Todo.fromMap(res.data);
  }
  return null;
}

Future<List<Todo>>readData() async {  // 어떤 데이터를 보내줄 것인지 명시해야 하므로 Future입력.
  Dio dio = Dio();
  var url = ' https://jsonplaceholder.typicode.com/todos';
  var res = await dio.get(url);
  // print(res.data);
  // print(res.data.runtimeType);  // 보통 List<dynamic>으로 오기 때문에 map으로 바꿔줘야 한다.
  if (res.statusCode == 200) {
    var data = List<Map<String, dynamic>>.from(res.data);  // List<dynamic>  // List<Map<String, dynamic>>
    return data.map((e) => Todo.fromMap(e)).toList();
  }
  return [];
}

void main() async {
  // print(Todo.fromMap({
  //   "userId": 1,
  //   "id": 1,
  //   "title": "delectus aut autem",
  //   "completed": false
  // }));
  // var todoNumber = 5;
  // var data = await getData(todoNumber);
  // print(data);
  var allTodos = await readData();
  print(allTodos);
  print(allTodos[1].title);
  print(allTodos[2].title);
}