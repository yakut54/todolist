part of 'todo_bloc.dart';

@immutable
class TodoState extends Equatable {
  final List<Todo> allTodos;

  const TodoState({this.allTodos = const <Todo>[]});

  @override
  List<Object> get props => [allTodos];
}
