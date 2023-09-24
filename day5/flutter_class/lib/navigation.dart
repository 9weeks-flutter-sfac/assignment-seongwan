import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,  // 자동으로 생성되는 이전 페이지로 가는 버튼을 없앤다.
      ),
      body: TextButton(
        onPressed: () {
          Navigator.pop(context);  // pop 이전 페이지. 마지막(현재) 페이지를 뺀다. 별도의 MaterialPageRoute가 필요 없다.
        },
        child: Text('A')),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Text('B'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(  // 새로운 페이지를 불러온다.
            context,  // context. 고정값, 현재 위젯의 상태 정보.
            MaterialPageRoute(builder: (context) => FirstPage(),)
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}