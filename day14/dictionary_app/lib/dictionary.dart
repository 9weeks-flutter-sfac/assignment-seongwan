// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

// import 'dart:convert';

import 'package:dio/dio.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Dict {
  String word;
  String? phonetic;
  List<Phonetic> phonetics;
  List<Meaning> meanings;
  License license;
  List<String> sourceUrls;
  
  Dict({
    required this.word,
    required this.phonetic,
    required this.phonetics,
    required this.meanings,
    required this.license,
    required this.sourceUrls,
  });

  factory Dict.fromMap(Map<String, dynamic> map) {
    return Dict(
      word: map['word'], 
      phonetic: map['phonetic'], 
      phonetics: List<Phonetic>.from(map['phonetics'].map((e)=>Phonetic.fromMap(e))), 
      meanings: List<Meaning>.from(map['meanings'].map((e)=>Meaning.fromMap(e))), 
      license: License.fromMap(map['license']), 
      sourceUrls: List<String>.from(map['sourceUrls']), 
    );
  }
}

class License {
  String name;
  String url;
  
  License({
    required this.name,
    required this.url,
  });

  factory License.fromMap(Map<String, dynamic> map) {
    return License(
      name: map['name'],
      url: map['url'],
    );
  }
}

class Phonetic {
  String? text;
  String audio;
  String? sourceUrls;
  License? license;

  Phonetic({
    required this.text,
    required this.audio,
    required this.sourceUrls,
    required this.license,
  });
  

  factory Phonetic.fromMap(Map<String, dynamic> map) {
    return Phonetic(
      text: map['text'],
      audio: map['audio'],
      sourceUrls: map['sourceUrls'],
      license: map['license'] != null ? License.fromMap(map['license']) : null,
    );
  }
}

class Meaning {
  String partOfSpeach;
  List<Definition> definitions;
  List<String> synonyms;
  List<String> antonyms;

  Meaning({
    required this.partOfSpeach,
    required this.definitions,
    required this.synonyms,
    required this.antonyms,
  });


  factory Meaning.fromMap(Map<String, dynamic> map) {
    return Meaning(
      partOfSpeach: map['partOfSpeach'],
      definitions: List<Definition>.from(map['definitions'].map((e) => Definition.fromMap(e),),),
      synonyms: List<String>.from(map['synonyms']),
      antonyms: List<String>.from(map['antonyms']),
    );
  }

}

class Definition {
  String definition;
  List<String> synonyms;
  List<String> antonyms;
  String? example;

  Definition({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
    required this.example,
  });

  factory Definition.fromMap(Map<String, dynamic> map) {
    return Definition(
      definition: map['definition'], 
      synonyms: List<String>.from(map['synonyms']), 
      antonyms: List<String>.from(map['antonyms']),
      example: map['example']
    );
  }
}

void main() async {
  Dio dio = Dio();
  var url = 'https://api.dictionaryapi.dev/api/v2/entries/en/';
  var res = await dio.get(url+'pioneer');
  // print(res.data);
  // print(res.data.runtimeType);  // List<dynamic>
  // print(res.data.first.runtimeType);  // Map<String, dynamic>
  var dict = Dict.fromMap(res.data.first);
  print(dict.meanings);
  print(dict.phonetic);
  print(dict.license);
  print(dict.license.name);
  print(dict.license.url);
}