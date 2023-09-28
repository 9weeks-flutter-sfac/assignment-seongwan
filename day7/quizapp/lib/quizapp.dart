import 'package:flutter/material.dart';
import 'package:quizapp/QuizCard.dart';
List<Map<String, dynamic>> quizs = [
  {
    "question": "의학적으로 얼굴과 머리를 구분하는 기준은 어디일까요?",
    "answer": 2,
    "options": ["코", "눈썹", "귀", "머리카락"]
  },
  {
    "question": "다음 중 바다가 아닌 곳은?",
    "answer": 3,
    "options": ["카리브해", "오호츠크해", "사해", "지중해"]
  },
  {
    "question": "심청이의 아버지 심봉사의 이름은?",
    "answer": 2,
    "options": ["심전도", "심학규", "심한길", "심은하"]
  },
  {
    "question": "심청전에서 심청이가 빠진 곳은 어디일까요?",
    "answer": 4,
    "options": ["정단수", "육각수", "해모수", "인당수"]
  },
  {
    "question": "택시 번호판의 바탕색은?",
    "answer": 3,
    "options": ["녹색", "흰색", "노란색", "파란색"]
  }
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Icon> result = [];
  var pageController = PageController(viewportFraction: 0.8);  // viewportFraction을 설정하면 축소된다.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(  // Scaffold에는 gradient를 설정할 수 없으므로 Container를 활용하고 Scaffold의 색을 투명하게 바꾼다.
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pinkAccent,
              Colors.blue,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,  // 그림자
            centerTitle: true,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: result,
            ),
            leading: IconButton(
              onPressed: () {
                pageController.previousPage(
                    duration: Duration(milliseconds: 300), 
                    curve: Curves.easeIn,
                );
                setState(() {
                  
                });
              }, 
              icon: Icon(Icons.navigate_before),
            ),
            actions: [  // AppBar에는 Trailing이 없기 때문에 actions로 대체한다.
              IconButton(
                onPressed: () {
                  pageController.nextPage(
                    duration: Duration(milliseconds: 300), 
                    curve: Curves.easeIn,
                  );
                  setState(() {
                    
                  });
                }, 
                icon: Icon(Icons.navigate_next),
              ),
            ],
          ),
          body: PageView.builder(
            controller: pageController,
            itemCount: quizs.length,
            itemBuilder: (context, index) => QuizCard(
              quiz: quizs[index], 
              onCorrect: () {
                // print('정답');
                result.add(Icon(Icons.circle_rounded));  // 아이콘 위젯을 리스트에 넣을 수 있다.
                pageController.nextPage(
                  duration: Duration(milliseconds: 300), 
                  curve: Curves.easeIn);
                setState(() {
                  
                });
              }, 
              onIncorrect: () {
                // print('오답');
                result.add(Icon(Icons.close));  // 아이콘 위젯을 리스트에 넣을 수 있다.
                pageController.nextPage(
                  duration: Duration(milliseconds: 300), 
                  curve: Curves.easeIn);
                setState(() {
                  
                });
              }
            ),
          ),
          floatingActionButton: result.length == quizs.length 
            ? FloatingActionButton(  // 삼항연산자 이용
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.refresh, 
                  color: Colors.black,
                ),
                onPressed: () {
                  result.clear();
                  // result = [];
                  pageController.jumpToPage(0);  // 첫 페이지로 이동.
                  setState(() {
                    
                  });
                },
              )  
            : null,
        ),
      ),
    );
  }
}