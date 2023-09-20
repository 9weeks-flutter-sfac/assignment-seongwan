// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:new_project_for_youtubemusic_app/MusicTile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: ListView(
          children: [
            MusicTile(
              title: 'Come with me',
              artist: 'Surfaces 및 salem ilese',
              duration: '3:00',
              albumImg: 'assets/music_come_with_me.png',
            ),
            MusicTile(
              title: 'Good day',
              artist: 'Surfaces',
              duration: '3:00',
              albumImg: 'assets/music_good_day.png',
            ),  
            MusicTile(
              title: 'Honesty',
              artist: 'Pink Sweat\$',
              duration: '3:02',
              albumImg: 'assets/music_honesty.png',
            ),  
            MusicTile(
              title: 'I Wish I Missed My Ex',
              artist: '마할리아 버크마',
              duration: '3:24',
              albumImg: 'assets/music_i_wish_i_missed_my_ex.png',
            ),
            MusicTile(
              title: 'Plastic Plants',
              artist: '마할리아 버크마',
              duration: '3:20',
              albumImg: 'assets/music_plastic_plants.png',
            ),    
            MusicTile(
              title: 'Sucker for you',
              artist: '맷 테리',
              duration: '3:24',
              albumImg: 'assets/music_sucker_for_you.png',
            ),    
            MusicTile(
              title: 'Summer is for falling in love',
              artist: 'Sarah Kang & Eye Love Brandon',
              duration: '3:00',
              albumImg: 'assets/music_summer_is_for_falling_in_love.png',
            ),
            MusicTile(
              title: 'These days(feat. Jess Glynne, Macklemore & Dan Caplen)',
              artist: 'Rudimental',
              duration: '3:08',
              albumImg: 'assets/music_these_days.png',
            ),
            MusicTile(
              title: 'Zombie Pop',
              artist: 'DRP IAN',
              duration: '3:00',
              albumImg: 'assets/music_zombie_pop.png',
            ),                    
          ],
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