// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // nouns.take(50).forEach(print);
    return MaterialApp(
      // home: Scaffold(
      //   // appBar: AppBar(
      //   //   title: Text('단어 보여주기'),
      //   // ),
      //   body: PageView.builder(
      //     itemCount: nouns.length,
      //     itemBuilder: (context, index) => Center(
      //       child: Text(
      //         // nouns.first,
      //         nouns[index],
      //         style: TextStyle(
      //           color: Colors.black87, 
      //           fontWeight: FontWeight.bold, 
      //           fontSize: 46
      //         ),
      //       ),
      //     ),
      //   ),

      // ),
      home: PubDevPackages(),
    );
  }
}

class PubDevPackages extends StatelessWidget {
  const PubDevPackages({super.key});

  @override
  Widget build(BuildContext context) {
    var pageController = PageController();
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   // title: FadeInLeft(
      //   //   child: Text('Packages')
      //   // ),
      // ),
      body: PageView.builder(
        controller: pageController,
        itemCount: nouns.length,
        itemBuilder: (context, index) => ZoomIn(
          duration: Duration(milliseconds: 1500),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              badges.Badge(
                badgeContent: Text("A"),
                position: badges.BadgePosition.topEnd(top: -20),
                child: Text(
                  nouns[index], 
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  )
                ),
              ),
              IconButton(
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: nouns[index],
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                  );    
                }, 
                icon: FaIcon(FontAwesomeIcons.airbnb),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.bounceOut);
        },
        backgroundColor: Colors.amber,
        child: Icon(Icons.navigate_next),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Colors.amber,
        icons: [
          FontAwesomeIcons.airbnb,
          FontAwesomeIcons.facebook,
          // FontAwesomeIcons.instagram,
          // FontAwesomeIcons.instagram,
        ], 
        activeIndex: 1,
        gapLocation: GapLocation.center, 
        onTap: (_) {
          print(_);
        },
      ),
    );
  }
}