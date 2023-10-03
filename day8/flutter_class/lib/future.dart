import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

// void main() async {
//   print("로그인을 시도합니다.");
//   await Future.delayed(Duration(seconds: 3));
//   print("로그인에 성공했습니다.");
//   print("반가워요!");
// }

void main () async {
  print("로그인을 시도합니다.");
  await Future.delayed(Duration(seconds: 3)).then((res){
    print(res);
    print("로그인에 성공했습니다.");
  });
  print("반가워요!");
}