// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({super.key, required this.imgUrl, required this.foodName});
  final String imgUrl;  // 파라미터 설정
  final String foodName;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // color: Colors.green,
      margin: EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,  // 좌우로 모든 영역을 쓰게 만든다.
        children: [
          Expanded(
            child: Image.asset(
              imgUrl, 
              fit: BoxFit.cover  // 이미지로 전체 덮기
            ), 
          ),
          Text(foodName),
          Text('[담기]'),
        ],
      ),
    );
  }
}