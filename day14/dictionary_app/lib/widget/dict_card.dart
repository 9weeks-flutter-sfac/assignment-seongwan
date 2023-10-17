// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dictionary_app/widget/meaning_card.dart';
import 'package:flutter/material.dart';
import '../model/dict.dart';


class DictCard extends StatelessWidget {
  const DictCard({super.key, required this.dict});
  final Dict dict;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(  // 확장하는 성격.
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dict.word, 
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,),
            ),
            Divider(),
            ListView.builder(  // 스크롤하는 성격.
              shrinkWrap: true,  // Column과 ListView.builder로 인한 오류 해결.
              physics: const NeverScrollableScrollPhysics(),  // 내부의 스크롤 기능을 없앤다.
              itemCount: dict.meanings.length,
              itemBuilder: (context, index) {
                return MeaningCard(meaning: dict.meanings[index]);
              }
            )  // List를 쓰므로 ListView.builder를 사용.
          ],
        ),
      ),
    );
  }
}