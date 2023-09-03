class Todo {
  final int? id;
  final int? begin;
  final int isDone;
  final String name;
  final int deadline;
  final String importance;

  const Todo({
    this.id,
    required this.name,
    this.begin,
    required this.isDone,
    required this.deadline,
    required this.importance,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'begin': DateTime.now().millisecondsSinceEpoch,
      'isDone': isDone,
      'deadline': deadline,
      'importance': importance
    };
  }

  @override
  String toString() {
    return '''
  id: $id,
  name: $name,
  isDone: $isDone,
  begin: $begin,
  deadline: $deadline
  importance': $importance
      ''';
  }
}
