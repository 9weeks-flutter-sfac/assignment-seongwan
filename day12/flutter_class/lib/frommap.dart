// ignore_for_file: hash_and_equals, avoid_print

class Word {
  // 멤버 변수
  String word;
  String meaning;
  String example;

  // 기본 생성자
  Word({
    required this.word,
    required this.meaning,
    required this.example,
  });

  // 이름 있는 생성자(fromMap)
  Word.fromMap(Map<String, dynamic> map):
    word = map["word"],
    meaning = map["meaning"],
    example = map["example"];


  // 멤버 함수(override)
  @override
  String toString() => "Word($word / $meaning / $example)";  // override로 toString에 대한 기능을 재정의.

  // 멤버 함수(override)
  @override
  operator == (Object other) => other is Word && word == other.word;

  Map<String, dynamic> toMap() => {  // 중괄호로 쓰는 이유: Map 데이터 타입으로 return 한다. return 값의 데이터 타입: Map<String, dynamic>
    'word': word,
    'meaning': meaning,
    'example': example,
  };  
}

void main() {
  // Word wordA = Word(word: "Apple", meaning: "사과", example: "Give me an apple.");
  Map<String, dynamic> networkData = {
    "word": "Apple",
    "meaning": "사과",
    "example": "Can I get an apple?",
  };

  // 값을 받았다.
  var word = Word.fromMap(networkData);
  // print(word);
  print(word.toMap().runtimeType);
  print(word.toMap() is Map);
  // dio.get('url', word.toMap());
}