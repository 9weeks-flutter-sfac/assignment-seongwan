// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_class/OptionCard.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const KioskApp2());
}

class KioskApp2 extends StatelessWidget {
  const KioskApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  SharedPreferences? prefs;
  Dio dio = Dio();
  List<String> myMenu = [];
  List<int> myMenuPrice = [];
  
  Future<List<dynamic>> getData() async {
    var res = await dio.get('http://52.79.115.43:8090/api/collections/options/records');
    if (res.statusCode == 200){
      return res.data["items"];
    }
    return []; 
  }

  initPreferences() async {  // 초기화 함수.
    prefs = await SharedPreferences.getInstance();
    if (prefs != null) {
      var myList = prefs!.getStringList("myMenuList");
      myMenu = myList ?? [];  // 삼항연산자. myList가 null 일 때.
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    initPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: myMenu.isNotEmpty 
        ? FloatingActionButton.extended(  // 버튼 영역에 맞춰 글자 조절
          label: Text('결제하기'),
          onPressed: () {
            setState(() => myMenu = []);  // 화면 변화 적용           
          },
        ) 
      : null,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text('분식왕 이테디 주문하기'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,  // 컬럼 내용 정렬
            children: [
              Text('주문 리스트', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              // Text(myMenu.toString()),
              Container(
                alignment: Alignment.center,
                child: myMenu.isEmpty 
                  ? Text('주문한 메뉴가 없습니다.') 
                  // : ListView.builder(  // 삼항연산자
                  //     itemCount: myMenu.length,
                  //     scrollDirection: Axis.horizontal,
                  //     itemBuilder: (context, index) => Chip(
                  //       onDeleted: () {
                  //         myMenu.remove(myMenu[index]);  // 특정 인덱스에 해당하는 내용 삭제.
                  //         setState(() {});
                  //       },  // Chip에 삭제 버튼.
                  //       label: Text(myMenu[index]),
                  //     ),
                    // ),
                  : Wrap(  // 자동으로 줄을 바꾼다.
                    children: myMenu.map((e) => Chip(
                      onDeleted: () {
                        myMenu.remove(e);
                        setState(() {});
                      },
                      label: Text(e),
                      )
                    ).toList()
                  )
              ),
              SizedBox(height: 16,),
              Text('음식', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              Expanded(  // Column이나 Row 안의 영역에서 확장할 수 있게 한다.
                child: FutureBuilder(
                  future: getData(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.done) {
                      return GridView.builder(  // scroll 기능이 있다.
                        itemCount: snapshot.data?.length  ?? 0,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,  // crossAxisCount: 한 행에 넣는 그리드 수.
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                        ),
                        itemBuilder: (context, index) {
                          return OptionCard(
                            imgUrl: snapshot.data![index]["imageUrl"], 
                            name: snapshot.data![index]["menu"],
                            onTap: () {
                              if(prefs != null) {
                                prefs!.setStringList("myMenuList", myMenu);
                              }
                              myMenu.add(snapshot.data![index]["menu"]);
                              setState(() {});
                            },
                          );
                        },
                      );
                    }
                    return CircularProgressIndicator();
                  } 
                ),
              ),
            ], 
          ),
        ),
      ),
    );
  }
}