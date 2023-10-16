// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

class CatFact {
  String fact;
  int length;

  CatFact({required this.fact, required this.length});

  // fromJson도 된다.
  factory CatFact.fromMap(Map<String, dynamic> map) {
    return CatFact(
      fact: map['fact'], 
      length: map['lenth'],
    );
  }

  factory CatFact.fromFact(String fact) {
    return CatFact(fact: fact, length: fact.length);
  }

  @override
  String toString() {
    return "CatFact($fact, $length)";
  }
}

void main() async {
  Dio dio = Dio();
  var url = 'https://meowfacts.herokuapp.com/';

  var res = await dio.get(url);
    if(res.statusCode == 200) {
      var catFact = CatFact.fromMap(res.data);
      print(catFact.fact);
      print(catFact.fact.length);
      print(catFact.length);
      var data = CatFact.fromFact(res.data["fact"]);
      print(data);
    }
}