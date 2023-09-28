import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var mathScore = [96, 92, 94, 95, 73, 98, 78, 82, 96, 48];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('10개월간의 수학 점수'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,              
                  children: mathScore.where((element) {
                    return element > 80;
                  }).map((e) {
                    return Container(
                      width: e * 2,
                      height: 24,
                      margin: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.greenAccent,
                            Colors.white,
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          )),
      ),
    );
  }
}