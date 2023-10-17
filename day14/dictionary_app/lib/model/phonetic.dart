import 'package:dictionary_app/model/license.dart';

class Phonetic {
  String? text;
  String? audio;
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