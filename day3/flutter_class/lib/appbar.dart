import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('플러터 굉장하다.'),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,  // 글자색
          leading: Icon(Icons.access_time),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.share),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_cart),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
          ],  // trailing은 하나만 적용할 때 쓴다.
          elevation: 0,
          centerTitle: false,
        ),
        body: Text('Flutter is the best!'),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: '홈'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: '검색'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          ], // items required
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.black12,
          elevation: 0,  // 그림자
          child: Icon(Icons.add),
          mini: true,
        ),
      )
    );
  }
}