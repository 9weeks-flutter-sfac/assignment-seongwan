// import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

// Future builder를 통해서 네트워크 데이터를 가져올 때 setState 이외에 다시 불러올 방법이 없다.
// 일반적으로 데이터를 요청해서 setState로 새로운 데이터를 주고 ListView.builder로 해결한다.

import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_class/widget/filter_bottom_sheet.dart';

import '../model/todo.dart';
import '../widget/todo_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var url = 'https://jsonplaceholder.typicode.com/todos';
  Dio dio = Dio();
  List<Todo> todos = [];
  TodoFilter todoFilter = TodoFilter.all;  // 현재 필터가 적용된 값.

  readTodos() async {
    var res = await dio.get(url);
    if(res.statusCode == 200) {
      var data = List<Map<String, dynamic>>.from(res.data);
      setState(() => todos = data.map((e) => Todo.fromMap(e)).toList());  //setState로 화면을 새로고침.
    }
  }

  @override
  void initState() {
    super.initState();
    readTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        flexibleSpace: ClipRect(  // AppBar를 넘어가는 부분을 잘라낸다.
          child: BackdropFilter(
            filter: ImageFilter.blur(  // AppBar 배경 블러 처리.
              sigmaX: 10,  // 높을수록 짙어진다.
              sigmaY: 10,
            ),
            child: Container()
          ),
        ),
        title: Text('Todo App'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: () {
              showModalBottomSheet(
                context: context, 
                builder: (context) => FilterBottomSheet(
                  filter: todoFilter, 
                  onApply: (value) {
                    // print(value);
                    setState(() => todoFilter = value);
                  },
                )
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh_sharp),
            onPressed: () {
              readTodos();  // 새로고침. 다시 데이터 받아오기.
            },
          )
        ]),
      body: ListView.builder(
        itemCount: filterMaker(todos).length,
        itemBuilder: (context, index) => TodoCard(
          todo: filterMaker(todos)[index]
        )
      ),
    );
  }

  List<Todo> filterMaker(List<Todo> value) {
    switch (todoFilter) {
      case TodoFilter.all:
        return value;
      case TodoFilter.completed:
        return value.where((element) => element.completed == true).toList();
      case TodoFilter.incompleted:
        return value.where((element) => element.completed == false).toList();
    }
  }
}