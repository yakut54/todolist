part of 'todo_bloc.dart';

@immutable
class TodoState extends Equatable {
  final List<Todo> allTodos;
  final Todo? editableTodo;

  const TodoState({
    this.allTodos = const <Todo>[],
    this.editableTodo,
  });

  @override
  List<Object> get props => [allTodos, editableTodo!];
}
