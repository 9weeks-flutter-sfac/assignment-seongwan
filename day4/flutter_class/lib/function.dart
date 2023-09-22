// ignore_for_file: avoid_print, unused_import

import 'package:flutter/material.dart';

void main() {
  print("hello");
  printWelcomeMsg();
  print(getMyAge());
  print(getMyNickname());
  var isFollowed = tryFollow();
  print(isFollowed);
}

int example() {
  return 0;
}
String example2() {
  return "9";  
}

List example3() {
  return ["9"];  
}

void printWelcomeMsg() {
  print("새로운 유저가 입장했습니다.");
  print("모두 환하게 반겨주세요!");
}

int getMyAge(){
  return 999;
}

String getMyNickname() {
  // var user = // 유저 정보 //
  // return user.name;
  return "Teddy";
}

List<String> getMyFollowers() {
//   var followers = //서버통신에서 팔로우 가져오기//
//   return followers;
  return ['제니', '뷔'];
}

bool tryFollow() {
//   var res = //
//   return res;
  return true;
}