// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

import 'package:profile_app/model/address.dart';
import 'package:profile_app/model/company.dart';

class Profile {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;
  
  Profile({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'] as int,
      name: map['name'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      address: Address.fromMap(map['address'] as Map<String,dynamic>),
      phone: map['phone'] as String,
      website: map['website'] as String,
      company: Company.fromMap(map['company'] as Map<String,dynamic>),
    );
  }
}
