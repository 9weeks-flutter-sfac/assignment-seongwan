import 'package:dictionary_app/model/definition.dart';

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