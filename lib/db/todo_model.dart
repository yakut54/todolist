// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Todo extends Equatable {
  int? id;
  int? isDone;
  int? isDeleted;
  int? begin;
  final int deadline;
  final String title;
  final String importance;

  Todo({
    this.id,
    this.isDone,
    this.isDeleted,
    this.begin,
    required this.deadline,
    required this.title,
    required this.importance,
  }) {
    begin = begin ?? DateTime.now().millisecondsSinceEpoch;
    isDone = isDone ?? 0;
    isDeleted = isDeleted ?? 0;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'begin': begin,
      'deadline': deadline,
      'title': title,
      'importance': importance,
    };
  }

  @override
  List<Object?> get props =>
      [id, isDone, isDeleted, begin, deadline, title, importance];

  Todo copyWith({
    int? id,
    int? isDone,
    int? isDeleted,
    int? begin,
    int? deadline,
    String? title,
    String? importance,
  }) {
    return Todo(
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
      begin: begin ?? this.begin,
      deadline: deadline ?? this.deadline,
      title: title ?? this.title,
      importance: importance ?? this.importance,
    );
  }
}
