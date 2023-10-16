// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';

class Slip {
  int id;
  String advice;

  Slip({required this.id, required this.advice});

  factory Slip.fromMap(Map<String, dynamic> map) {
    return Slip(
      id: map['id'],
      advice: map['advice'],
    );
  }

  @override
  toString() => 'Slip($advice, $id)';
}

void main() async {
  Dio dio = Dio();
  var url = 'https://https://api.adviceslip.com/advice';

  var response = await dio.get(url);
  if (response.statusCode == 200) {
    // print(response.data.runtimeType);  // response.data가 String이다.
    // print(jsonDecode(response.data)['slip']);  // json으로 변환.
    var myData= jsonDecode(response.data);
    var slipData = Slip.fromMap(myData['slip']);
    print(slipData);
  }
}