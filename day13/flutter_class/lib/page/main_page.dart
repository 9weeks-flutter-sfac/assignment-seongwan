// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_class/model/dog.dart';
import 'package:flutter_class/widget/dog_detail_dialog.dart';

class MainPage extends StatelessWidget {  // FutureBuilder를 사용하지 않겠다면 StatefulWidget을 사용해야 한다. 사용한다면 StatefulWidget으로 바꿀 필요 없다.
  const MainPage({super.key});

  Future<Dog?> getData() async {
    var url = 'https://dog.ceo/api/breeds/image/random';
    Dio dio = Dio();
    
    var res = await dio.get(url);
    if (res.statusCode == 200) {  // 404가 나오면 null이 반환된다. Future<Dog?>처럼 null safety를 적용해야 한다.
      return Dog.fromMap(res.data);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4,  // 이미지 사이 간격.
          mainAxisSpacing: 4, 
        ), 
        itemBuilder: (context, index) {
          return FutureBuilder(
            future: getData(), 
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // return Text(snapshot.data?.message ?? 'Error');
                return snapshot.data?.message == null
                  ? SizedBox()
                  : GestureDetector(
                    onTap: () {
                      print(snapshot.data);
                      showDialog(
                        context: context, 
                        builder: (context) => DogDetailDialog(
                          dog: snapshot.data!,
                        )
                      );
                    },
                    child: Image.network(  // URL로 정보가 전달되므로 Image.network를 사용. 
                      snapshot.data!.message,  // data가 null이 아닌 게 확실하므로 ! 사용.
                      fit: BoxFit.cover,
                      ),
                  );  
              }
              return CircularProgressIndicator();  // builder는 항상 무언가를 return해야 한다.
            }
          );
        }
      ),
    );
  }
}