// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: SafeArea(
//           child: ListView(
//             children: [
//               Text('안녕 난 1번 ListView의 자식이다'),
//               Text('나도! 1번 ListView의 자식이야'),
//               ListView(
//                 children: [
//                   Text('난 2번의 자식임'),
//                   Text('나도 2번의 자식임'),
//                 ],
//                 shrinkWrap: true,
//               ),
//               Text('난 멀리 떨어져있지만 1번의 자식이야'),
//             ]
//           )
//         ),
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '오늘의 하루는',
                  style: TextStyle(
                    fontSize: 32, 
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  '어땠나요?',
                  style: TextStyle(
                    fontSize: 24
                  ),
                ),
                SizedBox(
                  height: 16
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 2 / 3,
                  height: 200,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.black, Colors.white]
                          ),
                        ),
                        width: 290,
                        height: 200,
                        child: Center(
                          child: Text(
                            '우울함',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white, 
                              fontSize: 24, 
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.orange, Colors.yellow]
                          ),
                        ),
                        width: 290,
                        height: 200,
                        child: Center(
                          child: Text(
                            '행복함',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white, 
                              fontSize: 24, 
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.blue, Colors.green]
                          ),
                        ),
                        width: 290,
                        height: 200,
                        child: Center(
                          child: Text(
                            '상쾌함',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white, 
                              fontSize: 24, 
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 30
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  color: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage(
                          'https://picsum.photos/100/100',
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '라이언',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              '게임개발\nC#, Unity',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),  
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}