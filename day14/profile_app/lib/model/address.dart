// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

import 'package:profile_app/model/geo.dart';

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;
  
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      street: map['street'] as String,
      suite: map['suite'] as String,
      city: map['city'] as String,
      zipcode: map['zipcode'] as String,
      geo: Geo.fromMap(map['geo'] as Map<String,dynamic>),
    );
  }
}
