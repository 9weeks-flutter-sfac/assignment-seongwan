import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        FlutterLogo(size: 94),
        SizedBox(height: 8,),
        Text(
          '비밀 듣는 고양이',
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}