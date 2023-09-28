// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_class/MusicTile.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> playlist = [
      {
        "title": "Maniac",
        "artist": "코난 그레이",
        "albumImg": "https://picsum.photos/150/150",
        "duration": Duration(minutes: 3, seconds: 14),
      },
      {
        "title": "Heather",
        "artist": "코난 그레이",
        "albumImg": "https://picsum.photos/150/150",
        "duration": Duration(minutes: 2, seconds: 58),
      },
      {
        "title": "Maniac",
        "artist": "코난 그레이",
        "albumImg": "https://picsum.photos/150/150",
        "duration": Duration(minutes: 3, seconds: 8),
      },
    ];
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.dark(),  // 글자색까지 반전
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.navigate_before),
          shape: Border(
            bottom: BorderSide(color: Colors.white24, width: 1),
          ),
          title: Text('아워리스트'),
          elevation: 0,
          centerTitle: false,  // title 왼쪽으로 정렬
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.airplay),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: playlist.length,
          itemBuilder: (context, index) => MusicTile(
            title: playlist[index]["title"], 
            artist: playlist[index]["artist"], 
            duration: playlist[index]["duration"].toString(), 
            albumImg: playlist[index]["albumImg"]),          
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2,
          fixedColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: '둘러보기',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music),
              label: '보관함',
            )
          ],
        ),
        bottomSheet: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 64,
              color: Colors.white12,
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset('assets/music_you_make_me.png'),
                ),
                title: Text('You Make Me'),
                subtitle: Text('DAY6'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,  // trailing 위치 해결
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.play_arrow),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.skip_next),
                    )
                  ],
                ),
              )
            ),
            Container(
              height: 1,
              alignment: Alignment.centerLeft,  // child의 위치 정렬
              child: Container(
                width:120,
                color: Colors.white ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}