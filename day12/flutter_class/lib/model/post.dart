import 'package:flutter_class/model/comment.dart';

class Post {
  // 클래스 멤버 변수
  String symbolImg;
  String postUrl;
  String title;
  DateTime createdAt;
  Duration? readTime;
  String thumbnailImag;
  int? upCount;
  List<Comment> comments;

  // 클래스 생성자
  Post({
    required this.symbolImg,
    required this.postUrl, 
    required this.title, 
    required this.createdAt, 
    required this.readTime, 
    required this.thumbnailImag, 
    this.upCount,
    required this.comments});

  // 클래스 메소드
  addUpCount() {
    if (upCount != null) {
      upCount = upCount! + 1;
    } else {
      upCount = 1;
    }
  }
  
  addCommnet(Comment comment) {
    comments.add(comment);
  }
}