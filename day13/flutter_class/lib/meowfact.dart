// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

class MeowFact {
  List<String> data;

  MeowFact({required this.data});
  
  // 이름 있는 생성자
  // MeowFact.fromMap2(Map map) : data = map['data'];  // 간결하지만 함수처럼 이용할 수가 없다.

  factory MeowFact.fromMap(Map<String, dynamic> map)  {
    // print(map['data'].runtimeType);  // List<dynamic>이라고 나온다.
    var data = List<String>.from(map['data']);  // List<dynamic>이 List<String>으로 바뀐다.
    return MeowFact(data: data);
  }

  @override
  String toString() {
    return "MeowFact($data)";
  }
}

void main() async {
  Dio dio = Dio();  // Dio로 네트워크 데이터 가져오기.
  var url = 'https://meowfacts.herokuapp.com/';

  for (var i = 0; i < 10; i++) {
    var response = await dio.get(url);

    if (response.statusCode == 200) {
      // print(response.data);
      var fact1 = MeowFact.fromMap(response.data);
      print(fact1);
    }
  }
  // var fact1 = MeowFact(data: ['123', '456']);
  // var fact2 = MeowFact.fromMap({
  //   'data': ['123', '456']
  // });
  // print(fact1);
  // print(fact2);
}