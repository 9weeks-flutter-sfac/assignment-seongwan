// import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Company {
  String name;
  String catchPhrase;
  String bs;
  
  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      name: map['name'] as String,
      catchPhrase: map['catchPhrase'] as String,
      bs: map['bs'] as String,
    );
  }
}
