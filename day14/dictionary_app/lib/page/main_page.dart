// 추가 코드를 작성할 것. 본 소스는 디자인만 작성되어 있으며
// 이 기본 틀을 통하여 과제에 필요한 소스코드를 추가적으로 구현할 것.
// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:dictionary_app/model/dict.dart';
import 'package:dictionary_app/widget/dict_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Dict? dict;
  Dio dio = Dio();
  
  search(String query) async {
    var url = 'https://api.dictionaryapi.dev/api/v2/entries/en/';
    try {  // 404 에러에 대비.
      var res = await dio.get(url + query);
      // print(res.data.first);
      var data = res.data.first;  // res.data가 List로 오므로 첫 데이터를 받는다.
      dict = Dict.fromMap(data); 
      setState(() {});  // 화면 새로고침.
    } catch (e) {
      dict = null;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dictionary App'),
        elevation: 0,
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "Search",
                        suffixIcon: Icon(Icons.search),  // 버튼을 눌렀을 때 동작하게 하려면 IconButton으로 변경.
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      onSubmitted: (value) {
                        search(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            // Text(dict.toString()),
            if(dict != null) 
              Expanded(  // DictCard가 어느 정도의 사이즈가 될 지 모르니 확장할 수 있는 만큼 가능하게 설정.
                child: SingleChildScrollView(  // 스스로 스크롤 할 수 있도록 만든다.
                  child: DictCard(
                    dict: dict!
                  ),
                )
              )
          ],
        ),
      ),
    );
  }
}