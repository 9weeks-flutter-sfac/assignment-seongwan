import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var pageController = PageController();
    // var idController = TextEditingController(text: '');
    // var pwController = TextEditingController(text: '');  // 하나의 Controller를 사용하면 값이 같이 바뀌기에 따로 만든다.
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            pageController.nextPage(duration: Duration(microseconds: 500), curve: Curves.easeIn);
          },
          child: Icon(Icons.navigate_next),
          ),
        body: DefaultTextStyle(
          style: TextStyle(fontSize: 36, color: Colors.black), 
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: PageView(
                physics: NeverScrollableScrollPhysics(),  // Swipe로 페이지를 넘어갈 수 없게 한다. ListView에도 있다.
                controller: pageController,
                children: [
                  Text('A페이지'),
                  Text('B페이지'),
                  Text('C페이지'),
                ],
              ),
            ),
            // child: Column(
            //   children: [
            //     TextField(
            //       controller: idController,
            //     ),
            //     TextField(
            //       controller: pwController,
            //       obscureText: true,  // 비밀번호를 가린다.
            //     ),
            //     TextButton(
            //       onPressed: () {
            //         print(idController.text);
            //         print(pwController.text);
            //       }, 
            //       child: Text('로그인'),
            //     ),
            //     // TextButton(
            //     //   onPressed: () {
            //     //     print(myController.text);
            //     //   }, 
            //     //   child: Text('Hit me')
            //     // ),
            //     // TextButton(
            //     //   onPressed: () {
            //     //     myController.text = 'Hi there!';
            //     //   }, 
            //     //   child: Text('Erase'),
            //     // ),
            //   ],
            // ),
            // child: PageView(
            //   onPageChanged: (v) {  // v(value)로 설정하면 페이지가 바뀔 때 페이지의 인덱스 번호가 출력된다.
            //     print(v);
            //   },
            //   children: [
            //     Text('A페이지'),
            //     Text('B페이지'),
            //     Text('C페이지'),
            //   ],
            // )
          ),
        )
      )
    );
  }
}