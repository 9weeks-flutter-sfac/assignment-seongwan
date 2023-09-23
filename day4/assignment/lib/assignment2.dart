// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:assignment/OptionCard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List myMenu = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.extended(  // 버튼 영역에 맞춰 글자 조절
          onPressed: () {
            myMenu = [];
            setState(() {});  // 화면 변화 적용
          },
          label: Text('초기화하기'),),
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,  // 텍스트 색상이다. 설정하지 않으면 전체가 배경생으로만 보인다.
          title: Text('분식왕 이테디 주문하기'),
          elevation: 0,  // 그림자
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,  // 컬럼 내용 정렬
          children: [
            Text('주문 리스트', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
            Text(myMenu.toString()),
            SizedBox(height: 8,),
            Text('음식', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
            Expanded(  // Column이나 Row 안의 영역에서 확장할 수 있게 한다.
              child: GridView(  // scroll 기능이 있다.
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),  // crossAxisCount: 한 행에 넣는 그리드 수.
                children: [
                  InkWell(
                    onTap: () {  // 이벤트 핸들러
                      myMenu.add('떡볶이');
                      setState(() {});
                    },
                    child: OptionCard(
                      foodName: '떡볶이',
                      imgUrl: 'assets/option_bokki.png',
                    ),
                  ),  // 커스텀위젯
                  InkWell(
                    onTap: () {
                      myMenu.add('맥주');
                      setState(() {});
                    },
                    child: OptionCard(
                      foodName: '맥주',
                      imgUrl: 'assets/option_beer.png',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      myMenu.add('김밥');
                      setState(() {});
                    },
                    child: OptionCard(
                      foodName: '김밥',
                      imgUrl: 'assets/option_kimbap.png',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      myMenu.add('오므라이스');
                      setState(() {});
                    },
                    child: OptionCard(
                      foodName: '오므라이스',
                      imgUrl: 'assets/option_omurice.png',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      myMenu.add('라멘');
                      setState(() {});
                    },
                    child: OptionCard(
                      foodName: '라멘',
                      imgUrl: 'assets/option_ramen.png',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      myMenu.add('돈까스');
                      setState(() {});
                    },
                    child: OptionCard(
                      foodName: '돈까스',
                      imgUrl: 'assets/option_pork_cutlets.png',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      myMenu.add('우동');
                      setState(() {});
                    },
                    child: OptionCard(
                      foodName: '우동',
                      imgUrl: 'assets/option_udon.png',
                    ),
                  ),
                ],
              ),
            ),
          ], 
        ),
      ),
    );
  }
}