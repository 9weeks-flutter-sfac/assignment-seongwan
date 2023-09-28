import 'package:flutter/material.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({super.key, required this.quiz, required this.onCorrect, required this.onIncorrect});
  final Map<String, dynamic> quiz;
  final Function onCorrect;
  final Function onIncorrect;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            quiz['question'],
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 18
            ),
          ),
          // Text(quizs[index]['answer'].toString()),
          // Text(quizs[index]['options'].toString()),
          SizedBox(
            height: 16
          ),
          ListView.builder(
            itemCount: quiz['options'].length,  // itemCount가 정해져야 index 이용 가능.
            shrinkWrap: true,  // PageView.builder 안에 ListView.builder가 있음으로써 발생하는 사이즈 에러 해결.
            itemBuilder: (context, index) => ElevatedButton(
              onPressed: () {
                if(quiz['answer'] == index + 1){
                  onCorrect();
                } else {
                  onIncorrect();
                }
              },
              child: Text(quiz["options"][index]),
            )
          ),
        ],
      ),
    );
  }
}