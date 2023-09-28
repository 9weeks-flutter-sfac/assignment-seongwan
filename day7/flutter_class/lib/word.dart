// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> words = [
      {"word": "apple", "meaning": "사과", "example": "I want to eat an apple."},
      {
        "word": "paper",
        "meaning": "종이",
        "example": "Could you give me a paper?"
      },
      {
        "word": "resilient",
        "meaning": "탄력있는, 회복력있는",
        "example": "She's a resilient girl."
      },
      {
        "word": "revoke",
        "meaning": "취소하다",
        "example": "The authorities have revoked their original decision to allow development of this rural area."
      },
      {
        "word": "withdraw",
        "meaning": "철회하다",
        "example": "After lunch, we withdrew into her office to finish our discussion in private."
      },
    ];
    var pageController = PageController();

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SafeArea(
          child: PageView.builder(
            controller: pageController,
            itemCount: words.length,
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  words[index]['word'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1,  // 자간
                    fontSize: 24,
                  )
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(words[index]['meaning']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1,  // 자간
                    fontSize: 14,
                    color: Colors.grey),),
                const SizedBox(
                  height: 16,
                ),
                Text('"${words[index]['example']!}"',  // 따옴표 표시 방법
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 1,  // 자간
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,  // 기본적으로 오른쪽 버튼이 기준이기에 가운데로 중심을 옮긴다.
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                child: Icon(Icons.navigate_before),
                onPressed: () {
                  pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                }
              ),
              FloatingActionButton(
                child: Icon(Icons.navigate_next),
                onPressed: () {
                  pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}