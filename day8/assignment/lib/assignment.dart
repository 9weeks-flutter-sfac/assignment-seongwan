// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List<Map<String, dynamic>>> getData() async {
    var dio = Dio();
    var res = await dio.get('https://sniperfactory.com/sfac/http_day16_dogs');
    List<dynamic> data = res.data['body'];

    return List<Map<String, dynamic>>.from(data);
  }

  Future connectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    String message = "";
    if (connectivityResult == ConnectivityResult.wifi) {
      message = "와이파이가 연결되었습니다.";
    } else if (connectivityResult == ConnectivityResult.none) {
      message = "네트워크가 연결되지 않았습니다.";
    }

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: 150,
            child: Center(
              child: FutureBuilder(
                  future: Future.delayed(Duration(seconds: 3), () => message),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      // 현재 futureBuilder의 상태가 끝났을 때
                      return Text(snapshot.data!);
                    }
                    return Column(
                      children: [
                        Text("인터넷 연결 확인 중입니다."),
                        CircularProgressIndicator()
                      ],
                    );
                  }),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('8일차 과제'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          connectivity();
        },
        child: Icon(Icons.wifi_find_sharp),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Map<String, dynamic>> data = snapshot.data ?? [];
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.8),
                itemCount: data.length,
                itemBuilder: (context, index) => FutureBuilder(
                    future: Future.delayed(
                        Duration(seconds: 3),
                        () => Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                data[index]['url'],
                                              ),
                                              fit: BoxFit.cover)),
                                      height: 180,
                                      width: 180,
                                    ),
                                  ),
                                  Text(data[index]['msg']),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16),
                                        child: Icon(
                                          Icons.comment,
                                        ),
                                      ),
                                      SizedBox.shrink()
                                    ],
                                  ),
                                ],
                              ),
                            )),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        // 현재 futureBuilder의 상태가 끝났을 때
                        return snapshot.data!;
                      }
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Card(),
                      );
                    }));
          }
        },
      ),
    );
  }
}