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
//           // child: Column(
//           //   children: [
//           //     // Text('안녕하세요.'), 
//           //     // Icon(Icons.access_time),
//           //     // Text('이 아이콘은 더하기 아이콘입니다.'),
//           //     // Icon(Icons.add),
//           //     // Text('신기하쥬?'),
//           //     ],
//           // ),
//           // child: Row(
//           //   children: [
//           //     Text('더하기 아이콘:'),
//           //     Icon(Icons.add),
//           //   ],
//           // ),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Text('더하기 아이콘: '),
//                   Icon(Icons.add),
//                 ],),
//               Row(
//                 children: [
//                   Text('친구들 아이콘: '),
//                   Icon(Icons.people),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Text('수정 아이콘: '),
//                   Icon(Icons.edit),
//                 ],
//               ),
//             ],),
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
          // child: ListTile(
          //   title: Text('이테디'),
          //   subtitle: Text('010-4713-8754'),
          //   leading: Icon(Icons.access_time),
          //   trailing: Icon(Icons.call),
          // ),
          // child: Padding(
          //   child: Text('안녕하세요.'),
          //   padding: EdgeInsets.all(8),
          // )
          // child: ListTile(
          //   title: Text('이테디'),
          //   subtitle: Text('010-1234-5678'),
          //   leading: Padding(
          //     padding: const EdgeInsets.all(8),
          //     child: Icon(Icons.person),
          //   ),
          // ),
          // child: Center(
          //   child: Text('안녕하세요.'),
          // )
          // child: Container(
          //   color: Colors.black12, 
          //   child: Text('안녕하세요.'),
          // )
          // child: SizedBox(
          //   width: 300,
          //   height: 300,
          //   child: Center(
          //     child: Text('이테디'),
          //   ),
          // ),
          // 
          child: Image.network('src')
        ),
      )
    );
  }
}