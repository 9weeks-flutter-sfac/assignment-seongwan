void main() {
  // for (var i = 50; i <= 150; i++){
  //   print(i);
  // }
  // for (var i = 0; i <= 100; i++){
  //   if (i % 2 == 0) {
  //     print(i);
  //   }
  // }
  //   // 짝수만 출력
  List myFriends = ['저스틴', '주노', '크리스', '해리', '헬렌'];
  // for (var friend in myFriends) {
  //   print('$friend아(야) 안녕? 반가워');
  // }
  myFriends.forEach((element) {
    print(element);
   });  // element 대신 e로도 쓰인다.
} // forEach는 멤버함수라고 한다.