// ignore_for_file: prefer_initializing_formals

class User {
  // 멤버 변수
  String name;
  String phone;  // ?를 통해 null이 입력 가능하도록 한다.

  // 이름 없는 생성자 함수
  // User(this.name, this.phone);  // this == 나의 변수명.

  // User(String name) : name = name;  // this 대신 쓰는 또 다른 방법.

  // 이름 있는 생성자 함수
  // User.withName(String inputName, String phone) // 멤버 변수가 복수 일 때.
  //   : name = inputName,
  //     phone = phone;

  // User.withName(this.name);
  // User.withAnonymous() : name = 'Unknown';  // 익명으로 처리할 때 쓴다.
  // User.withName({  // 속성값을 명확히 나타내고 싶을 때 curly bracket으로 감싼다. positional argument
  //   required String name,
  //   required String phone,
  // }) : name = name,
  //      phone = phone;
  User.withName(  // 하나만 선택 매개변수로 만들 수 있다. 선택매개변수가 되면 값이 필요하다는 required를 써서 key를 이용할 수 있다.
    String name, {required String phone}) : name = name, phone = phone;  // ?를 써서 phone에 null 입력될 수 있게 하면 required는 지워야 한다.
}

void main() {
  // var user1 = User('이테디');
  // var user2 = User('홍길동');

  // print(user1.name);
  User.withName('이테디', phone: '010-1111-1111');
}