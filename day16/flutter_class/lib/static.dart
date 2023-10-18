// ignore_for_file: public_member_api_docs, sort_constructors_first
class Student {
  static const schoolName = "Teddy's School";
  String studentId;
  String name;

  Student(this.studentId, this.name,);

  String get studentInfo => studentId + name + "GoodStudent";
  String get studentInfo2 {
    // return studentId + name;
    var newName = studentId + name;
    return newName;
  }
  int get nameLength => name.length;
  List get nameAsList => [name];

  set studentName(String v) {  // set: 데이터를 넣을 때 신중하게 검수해야 할 경우.
    if(v.length < 3) {
      return;
    }
    name = v;
  }
}

void main() {
  var stu1 = Student('Teddy', '010-1234-4567'); 
  print(stu1.studentInfo);
  print(stu1.nameLength);
  print(stu1.nameAsList);
  print(stu1.name);
  stu1.studentName = 'tedddddy';
  print(stu1.name);
}