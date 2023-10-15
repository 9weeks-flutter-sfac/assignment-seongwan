// ignore_for_file: avoid_print, prefer_initializing_formals, unnecessary_this

class User {
  // 멤버변수
  String userId;
  String nickname;
  String password;
  List<User> friends;

  // 생성자
  User(this.userId, this.nickname, this.password, this.friends) {
    print("${this.nickname}을 생성하겠습니다.");
  }  // 함수처럼 사용할 수도 있다.

  // 이름있는 생성자 함수
  User.creatUser(String nickname, String password) : 
    userId = 'newUserID',
    nickname = nickname,
    password = password,
    friends = [];

  friednAdd(User user) {
    friends.add(user);
  }  // 메소드 생성.
}

void main() {
  // var user1 = User('Ey09IdJK', 'TeddyGod', '********', []);
  // print(user1.nickname);

  // user1.nickname = 'TeddyKing';
  // print(user1.nickname);
  var originUser = User('ABC', 'Chris', '****', []);
  var newUser = User.creatUser('TeddyKing2', 'password123123');
  print(newUser.userId);
  print(newUser.nickname);
  print(newUser.password);
  print(newUser.friends);
  newUser.friednAdd(originUser);
  print(newUser.friends);
}