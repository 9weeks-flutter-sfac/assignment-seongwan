import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var myController = TextEditingController();  // 사용자가 입력한 값을 받아온다.
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: myController,
              ),
              TextButton(
                onPressed: () {
                  if(int.parse(myController.text) >= 10) {  // String에서 Int를 찾아낸다.
                    print('돈 보내기');
                  } else {
                    print('돈은 10원 이상부터 낼 수 있습니다.');
                  }
                  // print(myController.text);
                }, 
                child: Text('돈 보내기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}