// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dio/dio.dart';

class Activity {
  String activity;
  String type;
  int participants;
  double price;
  String link;
  String key;
  double accessibility;

  Activity({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
    required this.accessibility,
  });

  factory Activity.fromBoredApi(Map<String, dynamic> map) {
    return Activity(
      activity: map['activity'],
      type: map['type'],
      participants: map['participants'],
      price: map['price'] is int ? double.parse(map['price']) : map['price'],  // 삼항연산자를 이용.
      link: map['link'],
      key: map['key'],
      accessibility: map['accessibility'],
    );
  }

  @override
  String toString() {
    return 'Activity($activity $type $participants $price)';
  }
}

void main() async {
  Dio dio = Dio();
  var url = 'https://www.boredapi.com/api/activity';

  var response = await dio.get(url);
  if (response.statusCode == 200) {  
    // print(response.data);  // 데이터 확인
    // print(response.data.runtimeType);
    var activity = Activity.fromBoredApi(response.data);  // map이니까 바로 입력.
    print(activity);
  }
}
