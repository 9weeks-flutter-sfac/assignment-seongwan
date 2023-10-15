// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({Key? key, required this.imgUrl, required this.name, required this.onTap}) : super(key: key);
  final String imgUrl;  // 파라미터 설정
  final String name;
  final Function() onTap;  // 소괄호도 데이터 타입을 맞추기 위해 필요하다.

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,  // 좌우로 모든 영역을 쓰게 만든다.
          children: [
            Expanded(
              child: Image.network(
                imgUrl, 
                fit: BoxFit.cover  // 이미지로 전체 덮기
              ), 
            ),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '[담기]',
              style: TextStyle(fontWeight: FontWeight.w200),
            ),
          ],
        ),
      ),
    );
  }
}