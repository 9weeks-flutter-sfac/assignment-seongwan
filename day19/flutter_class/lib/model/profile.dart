import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Profile {
  String username;
  String? email;
  String name; 
  
  Profile({
    required this.username,
    required this.email,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'name': name,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      username: map['username'] as String,
      email: map['email'],
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) => Profile.fromMap(json.decode(source) as Map<String, dynamic>);
}
