// model 폴더에 class를 생성하여 저장한다.
class Dog {
  String message;
  String status;

  Dog({required this.message, required this.status});

  factory Dog.fromMap(Map<String, dynamic> map) {
    return Dog(
      message: map['message'],
      status: map['status'],
    );
  }

  @override
  String toString() {
    return message;
  }
}