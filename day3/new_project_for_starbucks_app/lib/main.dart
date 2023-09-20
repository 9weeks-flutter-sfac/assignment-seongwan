// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:new_project_for_starbucks_app/DrinkTile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.navigate_before),
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Text(
                'new'.toUpperCase(), 
                style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,                  
                ),
              ),
              SizedBox(
                height: 16,
              ),
              DrinkTile(
                title: '골든 미모사 그린티',
                subtitle: 'Golden Mimosa Green Tea',
                price: 6100,
                imgUrl: 'assets/item_drink1.jpeg',
              ),
              DrinkTile(
                title: '블랙 햅쌀 고봉 라떼',
                subtitle: 'Golden Mimosa Green Tea',
                price: 6000,
                imgUrl: 'assets/item_drink2.jpeg',
              ),
              DrinkTile(
                title: '아이스 블랙 햅쌀 고봉 라떼',
                subtitle: 'Golden Mimosa Green Tea',
                price: 6300,
                imgUrl: 'assets/item_drink3.jpeg',
              ),
              DrinkTile(
                title: '스타벅스 튜메릭 라떼',
                subtitle: 'Golden Mimosa Green Tea',
                price: 6400,
                imgUrl: 'assets/item_drink4.jpeg',
              ),
              DrinkTile(
                title: '아이스 스타벅스 튜메릭 라떼',
                subtitle: 'Golden Mimosa Green Tea',
                price: 6400,
                imgUrl: 'assets/item_drink5.jpeg',
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.green,
          currentIndex: 2,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',  // Text를 사용하지 않는다. 
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payment),
              label: 'Pay',  // Text를 사용하지 않는다. 
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.coffee),
              label: 'Order',  // Text를 사용하지 않는다. 
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: 'Shop',  // Text를 사용하지 않는다. 
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'Other',  // Text를 사용하지 않는다. 
            ),
          ],
        ),
        bottomSheet: Container(
          height: 64,
          color: Colors.black87,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,  // 좌우 공간 벌리기
              children: [
                Text(
                  '주문할 매장을 선택해주세요.', 
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                // Spacer(),  // 좌우 공간 벌리기
                Icon(Icons.expand_more, color: Colors.white,
                ),
                // Expanded(
                //   child: Text(
                //     '주문할 매장을 선택해주세요.', 
                //     style: TextStyle(
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                // Icon(Icons.expand_more, color: Colors.white,
                // ),  // 좌우 공간 벌리기
              ],
            ),
          ) 
        ),
      ),
    );
  }
}

