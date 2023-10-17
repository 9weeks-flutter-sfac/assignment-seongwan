// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo {
  String title;
  bool completed;
  int id;
  int userId;

  Todo({
    required this.title,
    required this.completed,
    required this.id,
    required this.userId,
  });

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      completed: map['completed'],
      id: map['id'],
      userId: map['userId'],
      title: map['title'],
    );
  }
}
