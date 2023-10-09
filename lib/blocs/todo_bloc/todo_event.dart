part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class LoadAllTodosEvent extends TodoEvent {
  @override
  List<Object> get props => [];
}

class AddTodoEvent extends TodoEvent {
  final Todo todo;
  const AddTodoEvent({required this.todo});

  @override
  List<Object> get props => [todo];
}

class DeleteAllTodosEvent extends TodoEvent {
  @override
  List<Object> get props => [];
}

class UpdateIsDoneEvent extends TodoEvent {
  final Todo todo;
  const UpdateIsDoneEvent({required this.todo});

  @override
  List<Object> get props => [todo];
}

class DeleteTodoEvent extends TodoEvent {
  final Todo todo;
  const DeleteTodoEvent({required this.todo});

  @override
  List<Object> get props => [todo];
}

class CreateEditableTodoEvent extends TodoEvent {
  final Todo todo;
  const CreateEditableTodoEvent({required this.todo});

  @override
  List<Object> get props => [todo];
}

class UpdateColorEvent extends TodoEvent {
  final Todo todo;
  const UpdateColorEvent({required this.todo});

  @override
  List<Object> get props => [todo];
}

class UpdateTitleEvent extends TodoEvent {
  final Todo todo;
  const UpdateTitleEvent({required this.todo});

  @override
  List<Object> get props => [todo];
}

class ResetEvent extends TodoEvent {
  final Todo todo;
  const ResetEvent({required this.todo});

  @override
  List<Object> get props => [todo];
}

// update deadline
// save editableTodo to Todo DB