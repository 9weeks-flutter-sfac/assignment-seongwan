// import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../model/todo.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.todo});
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Dismissible(  // Dismissible. swipe했을 때 내용을 지워준다. onDismissed를 이용하면 메모리에서도 제거한다.
      key: Key(todo.id.toString()),
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: todo.completed ? Colors.green.shade100 : null,
          border: todo.completed
            ? Border.all(
              color: Colors.green,
            )
            : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          title: Text(
            todo.title,
            style: TextStyle(
              color: todo.completed ? Colors.green : null,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: todo.completed
            ? const Icon(
              Icons.check_circle,
              color: Colors.green,
              )
            : null
        ),
      ),
    );
  }
}