// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:intl/intl.dart';

class MyApp2 extends StatefulWidget {
  const MyApp2({super.key});

  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('플러터 굉장하군'),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          centerTitle: false,
          leading: Icon(Icons.people),
          elevation: 0,
          actions: [
            Icon(Icons.share),
          ],
        ),
        body:Column(
          children: [
            // ListTile(
            //   title: Text('이테디'),
            //   trailing: IconButton(
            //     icon: Icon(Icons.call),
            //     onPressed: () {
            //       launchUrlString('sms: +8210-1000-1000');
            //       launchUrlString('https://sniperfactory.com');
            //     },
            //   ),
            //   onTap: () {},
            // ),
            // CachedNetworkImage(
            //   imageUrl: 'https://robohash.org/411.png?set=set1&size=150x150',
            // ),
            // CircleAvatar(
            //   backgroundImage: CachedNetworkImageProvider('https://robohash.org/411.png?set=set1&size=150x150'),
            // )
            Text(DateFormat('y/M/d EE').format(DateTime(2009, 9, 3))),  // 날짜 순서 변경 가능.
            Text('40000원'),
            Text(NumberFormat.currency(locale: 'ko_KR', symbol: 'KRW').format(40000)),
          ],
        ),
      ),
    );
  }
}