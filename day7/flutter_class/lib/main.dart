import 'package:flutter/material.dart';

void main() {
  // runApp(const MyApp());
  var myInfo = {
    "name": "Teddy",
    "height": 199.9,
    "age": 99,
    "phone": "010-1000-2000",
  };
  print(myInfo["name"].runtimeType);
  runApp(const MyApp());  // runtimeType은 데이터의 데이터타입
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}