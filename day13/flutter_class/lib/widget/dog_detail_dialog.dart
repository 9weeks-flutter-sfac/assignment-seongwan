// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_class/model/dog.dart';

class DogDetailDialog extends StatelessWidget {
  const DogDetailDialog({super.key, required this.dog});
  final Dog dog;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        ),
        clipBehavior: Clip.antiAlias,  // 이미지가 벗어났을 때 자르는 효과.
        child: Column(
          mainAxisSize: MainAxisSize.min,  // Column 자체가 기본적으로 확장하려고 하기 때문에 설정.
          children: [
            Image.network(dog.message),
            // Text(dog.message),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              }, 
              child: Text('Close')
            ),
          ]
        ),
      ),
    );
  }
}