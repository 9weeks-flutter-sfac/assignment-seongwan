import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: Scaffold(
        body: Center(
          child: Container(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(text: '이듬해 질 녘 꽃 피는 봄 한여름 밤의 꿈\n', style: TextStyle(color: Colors.lightBlue),),
                  TextSpan(text: '가을 타 겨울 내릴 눈 일 년 네 번 또다시 봄\n', style: TextStyle(color: Colors.lightBlue),),
                  TextSpan(text: '정들었던 내 젊은 날 이제는 안녕\n', style: TextStyle(color: Colors.lightBlue),),
                  TextSpan(text: '아름답던 우리의 봄 여름 가을 겨울\n', style: TextStyle(color: Colors.lightBlue),),
                  TextSpan(text: '(Four seasons with no reason)\n\n', style: TextStyle(color: Colors.lightBlue),),
                  TextSpan(text: '비 갠 뒤에 비애 대신 a happy end\n', style: TextStyle(color: Colors.red),),
                  TextSpan(text: '비스듬히 씩 비웃듯 칠색 무늬의 무지개\n', style: TextStyle(color: Colors.red),),
                  TextSpan(text: '철없이 철 지나 철들지 못해 (still)\n', style: TextStyle(color: Colors.red),),
                  TextSpan(text: '철부지에 철 그른지 오래\n\n', style: TextStyle(color: Colors.red),),
                  TextSpan(text: 'Marchin\' 비발디, 차이코프스키\n', style: TextStyle(color: Colors.green),),
                  TextSpan(text: '오늘의 사계를 맞이해 (boy)\n', style: TextStyle(color: Colors.green),),
                  TextSpan(text: '마침내, 마치 넷이 못내\n\n', style: TextStyle(color: Colors.green),),
                  TextSpan(text: '저 하늘만 바라보고서\n', style: TextStyle(color: Colors.grey),),
                  TextSpan(text: '사계절 잘 지내고 있어, goodbye\n', style: TextStyle(color: Colors.grey),),
                  TextSpan(text: '떠난 사람 또 나타난 사람\n', style: TextStyle(color: Colors.grey),),
                  TextSpan(text: '머리 위 저세상, 난 떠나 영감의 amazon\n\n', style: TextStyle(color: Colors.grey),),
                  TextSpan(text: '지난 밤의 트라우마 다 묻고\n', style: TextStyle(color: Colors.yellow),),
                  TextSpan(text: '목숨 바쳐 달려올 새 출발 하는 왕복선\n', style: TextStyle(color: Colors.yellow),),
                  TextSpan(text: '변할래 전보다는 더욱더\n', style: TextStyle(color: Colors.yellow),),
                  TextSpan(text: '좋은 사람 더욱더, 더 나은 사람 더욱더\n\n', style: TextStyle(color: Colors.yellow),),
                  TextSpan(text: '아침 이슬을 맞고 (내 안에)\n', style: TextStyle(color: Colors.blue),),
                  TextSpan(text: '내 안에 분노 과거에 묻고\n', style: TextStyle(color: Colors.blue),),
                  TextSpan(text: 'For life, do it away, away, away\n', style: TextStyle(color: Colors.blue),),
                  ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a blue toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
